import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:slider_button/slider_button.dart';

import '../../z_widget/div_scaffold.dart';

class RoundedLoadingButtonDemo extends StatefulWidget {
  const RoundedLoadingButtonDemo({Key? key}) : super(key: key);

  @override
  _RoundedLoadingButtonDemoState createState() =>
      _RoundedLoadingButtonDemoState();
}

class _RoundedLoadingButtonDemoState extends State<RoundedLoadingButtonDemo> {
  final RoundedLoadingButtonController _btnController1 =
      RoundedLoadingButtonController();

  final RoundedLoadingButtonController _btnController2 =
      RoundedLoadingButtonController();

  void _doSomething(RoundedLoadingButtonController controller) async {
    Timer(const Duration(seconds: 10), () {
      controller.success();
    });
  }

  @override
  void initState() {
    super.initState();
    _btnController1.stateStream.listen((value) {
      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return LRScaffold(
        title: 'RoundedLoadingButtonDemo',
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RoundedLoadingButton(
                successIcon: Icons.cloud,
                failedIcon: Icons.cottage,
                controller: _btnController1,
                onPressed: () => _doSomething(_btnController1),
                child: const Text('Tap me!',
                    style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(
                height: 50,
              ),
              RoundedLoadingButton(
                color: Colors.amber,
                successColor: Colors.amber,
                controller: _btnController2,
                onPressed: () => _doSomething(_btnController2),
                valueColor: Colors.black,
                borderRadius: 10,
                child: const Text('''
Tap me i have a huge text''', style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(
                height: 50,
              ),
              OutlinedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                  ),
                  onPressed: () {
                    _btnController1.reset();
                    _btnController2.reset();
                  },
                  child: const Text('Reset')),
              const SizedBox(
                height: 20,
              ),
              OutlinedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
                ),
                onPressed: () {
                  _btnController1.error();
                  _btnController2.error();
                },
                child: const Text('Error'),
              ),
              const SizedBox(
                height: 20,
              ),
              OutlinedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
                ),
                onPressed: () {
                  // _btnController1.success();
                  // _btnController2.success();
                  // _btnController1
                  print(_btnController1.currentState);
                },
                child: const Text('Success'),
              )
            ],
          ),
        ));
  }
}
