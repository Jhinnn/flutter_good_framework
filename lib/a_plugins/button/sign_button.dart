import 'package:flutter/material.dart';
import 'package:good_framework/z_model/plugins_model.dart';
import 'package:sign_button/sign_button.dart';

import '../../z_constants/constants.dart';
import '../../z_widget/div_scaffold.dart';

class SignButton extends StatefulWidget {
  
  const SignButton({Key? key}) : super(key: key);

  @override
  State<SignButton> createState() => AutoAnimatedState();
}

class AutoAnimatedState extends State<SignButton> {
  String _buttonClick = "click sign in button";
  @override
  Widget build(BuildContext context) {
    return LRScaffold(
        title: 'SignButton',
        child: Center(
          child: SingleChildScrollView(
              child: Column(
            children: [
              Text(
                '$_buttonClick',
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(
                height: 5.0,
              ),
              SignInButton(
                  buttonType: ButtonType.apple,
                  onPressed: () {
                    setState(() {
                      _buttonClick = "apple";
                    });
                  }),
              SignInButton(
                  buttonType: ButtonType.appleDark,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  onPressed: () {
                    setState(() {
                      _buttonClick = "appleDark";
                    });
                  }),
              SignInButton(
                  buttonType: ButtonType.facebook,
                  onPressed: () {
                    setState(() {
                      _buttonClick = "facebook";
                    });
                  }),
              SignInButton(
                  buttonType: ButtonType.facebookDark,
                  onPressed: () {
                    setState(() {
                      _buttonClick = "facebookDark";
                    });
                  }),
              SignInButton(
                  buttonType: ButtonType.twitter,
                  onPressed: () {
                    setState(() {
                      _buttonClick = "twitter";
                    });
                  }),
              SignInButton(
                  buttonType: ButtonType.github,
                  onPressed: () {
                    setState(() {
                      _buttonClick = "github";
                    });
                  }),
              SignInButton(
                  buttonType: ButtonType.githubDark,
                  onPressed: () {
                    setState(() {
                      _buttonClick = "githubDark";
                    });
                  }),
              SignInButton(
                  buttonType: ButtonType.google,
                  onPressed: () {
                    setState(() {
                      _buttonClick = "google";
                    });
                  }),
              SignInButton(
                  buttonType: ButtonType.googleDark,
                  onPressed: () {
                    setState(() {
                      _buttonClick = "googleDark";
                    });
                  }),
              SignInButton(
                  buttonType: ButtonType.linkedin,
                  onPressed: () {
                    setState(() {
                      _buttonClick = "linkedIn";
                    });
                  }),
              SignInButton(
                  buttonType: ButtonType.youtube,
                  onPressed: () {
                    setState(() {
                      _buttonClick = "youtube";
                    });
                  }),
              SignInButton(
                  buttonType: ButtonType.microsoft,
                  onPressed: () {
                    setState(() {
                      _buttonClick = "microsoft";
                    });
                  }),
              SignInButton(
                  buttonType: ButtonType.tumblr,
                  onPressed: () {
                    setState(() {
                      _buttonClick = "tumblr";
                    });
                  }),
              SignInButton(
                  buttonType: ButtonType.pinterest,
                  onPressed: () {
                    setState(() {
                      _buttonClick = "pinterest";
                    });
                  }),
              SignInButton(
                  buttonType: ButtonType.mail,
                  onPressed: () {
                    setState(() {
                      _buttonClick = "Mail";
                    });
                  }),
              SignInButton(
                  buttonType: ButtonType.reddit,
                  onPressed: () {
                    setState(() {
                      _buttonClick = "reddit";
                    });
                  }),
              SignInButton(
                  buttonType: ButtonType.yahoo,
                  onPressed: () {
                    setState(() {
                      _buttonClick = "yahoo";
                    });
                  }),
              SignInButton(
                  buttonType: ButtonType.amazon,
                  onPressed: () {
                    setState(() {
                      _buttonClick = "amazon";
                    });
                  }),
              SignInButton(
                  buttonType: ButtonType.quora,
                  onPressed: () {
                    setState(() {
                      _buttonClick = "quora";
                    });
                  }),
              SignInButton(
                  buttonType: ButtonType.instagram,
                  onPressed: () {
                    setState(() {
                      _buttonClick = "instagram";
                    });
                  }),
              //custom button
              SignInButton(
                  buttonType: ButtonType.pinterest,
                  imagePosition: ImagePosition.right,
                  //[buttonSize] You can also use this in combination with [width]. Increases the font and icon size of the button.
                  buttonSize: ButtonSize.large,
                  btnTextColor: Colors.grey,
                  btnColor: Colors.white,
                  width: 140,
                  //[width] Use if you change the text value.
                  btnText: 'Pinterest',
                  onPressed: () {
                    setState(() {
                      _buttonClick = "pinterest";
                    });
                  }),
              //disabled button
              SignInButton(
                  buttonType: ButtonType.yahoo,
                  //btnDisabledColor: Colors.grey,
                  //btnDisabledTextColor: Colors.grey[700],
                  onPressed: null),
              SignInButton.mini(
                buttonType: ButtonType.github,
                onPressed: () {},
              ),
              //disabled mini button
              SignInButton.mini(
                buttonType: ButtonType.github,
                //btnDisabledColor: Colors.grey,
                onPressed: null,
              ),
            ],
          )),
        ));
  }
}
