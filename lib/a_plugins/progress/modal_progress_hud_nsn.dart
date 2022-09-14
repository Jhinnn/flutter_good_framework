import 'dart:async';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ModelProgressHudNsnDemo extends StatefulWidget {
  const ModelProgressHudNsnDemo({super.key});

  @override
  _ModelProgressHudNsnDemoState createState() =>
      _ModelProgressHudNsnDemoState();
}

class _ModelProgressHudNsnDemoState extends State<ModelProgressHudNsnDemo> {
  // maintains validators and state of form fields
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  // manage state of modal progress HUD widget
  bool _isInAsyncCall = false;

  bool _isInvalidAsyncUser = false; // managed after response from server
  bool _isInvalidAsyncPass = false; // managed after response from server

  String? _username;
  String? _password;
  bool _isLoggedIn = false;

  // validate user name
  String? _validateUserName(String? userName) {
    if (userName!.length < 8) {
      return 'Username must be at least 8 characters';
    }

    if (_isInvalidAsyncUser) {
      // disable message until after next async call
      _isInvalidAsyncUser = false;
      return 'Incorrect user name';
    }

    return null;
  }

  // validate password
  String? _validatePassword(String? password) {
    if (password!.length < 8) {
      return 'Password must be at least 8 characters';
    }

    if (_isInvalidAsyncPass) {
      // disable message until after next async call
      _isInvalidAsyncPass = false;
      return 'Incorrect password';
    }

    return null;
  }

  void _submit() {
    if (_loginFormKey.currentState!.validate()) {
      _loginFormKey.currentState!.save();

      // dismiss keyboard during async call
      FocusScope.of(context).requestFocus(new FocusNode());

      // start the modal progress HUD
      setState(() {
        _isInAsyncCall = true;
      });

      // Simulate a service call
      Future.delayed(const Duration(seconds: 1), () {
        final _accountUsername = 'username1';
        final _accountPassword = 'password1';
        setState(() {
          if (_username == _accountUsername) {
            _isInvalidAsyncUser = false;
            if (_password == _accountPassword) {
              // username and password are correct
              _isInvalidAsyncPass = false;
              _isLoggedIn = true;
            } else
              // username is correct, but password is incorrect
              _isInvalidAsyncPass = true;
          } else {
            // incorrect username and have not checked password result
            _isInvalidAsyncUser = true;
            // no such user, so no need to trigger async password validator
            _isInvalidAsyncPass = false;
          }
          // stop the modal progress HUD
          _isInAsyncCall = false;
        });
        if (_isLoggedIn){}
          // do something
          // widget._onSignIn();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modal Progress HUD Demo'),
        backgroundColor: Colors.blue,
      ),
      // display modal progress HUD (heads-up display, or indicator)
      // when in async call
      body: ModalProgressHUD(
        inAsyncCall: _isInAsyncCall,
        // demo of some additional parameters
        opacity: 0.5,
        progressIndicator: const CircularProgressIndicator(),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: buildLoginForm(context),
          ),
        ),
      ),
    );
  }

  Widget buildLoginForm(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    // run the validators on reload to process async results
    _loginFormKey.currentState?.validate();
    return Form(
      key: _loginFormKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              key: const Key('username'),
              decoration: const InputDecoration(
                  hintText: 'enter username', labelText: 'User Name'),
              style: TextStyle(fontSize: 20.0, color: textTheme.button!.color),
              validator: _validateUserName,
              onSaved: (value) => _username = value,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              key: const Key('password'),
              obscureText: true,
              decoration: const InputDecoration(
                  hintText: 'enter password', labelText: 'Password'),
              style: TextStyle(fontSize: 20.0, color: textTheme.button!.color),
              validator: _validatePassword,
              onSaved: (value) => _password = value,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: ElevatedButton(
              onPressed: _submit,
              child: const Text('Login'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _isLoggedIn
                ? const Text(
                    'Login successful!',
                    key: Key('loggedIn'),
                    style: TextStyle(fontSize: 20.0),
                  )
                : const Text(
                    'Not logged in',
                    key: Key('notLoggedIn'),
                    style: TextStyle(fontSize: 20.0),
                  ),
          ),
        ],
      ),
    );
  }
}
