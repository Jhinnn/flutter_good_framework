import 'package:flutter/material.dart';
import 'package:slider_button/slider_button.dart';

import '../../z_widget/div_scaffold.dart';

class SliderButtonDemo extends StatefulWidget {
  const SliderButtonDemo({Key? key}) : super(key: key);

  @override
  _SliderButtonDemoState createState() => _SliderButtonDemoState();
}

class _SliderButtonDemoState extends State<SliderButtonDemo> {
  @override
  Widget build(BuildContext context) {
    return LRScaffold(
      title: 'SliderButtonDemo',
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SliderButton(
              action: () {
                ///Do something here
                Navigator.of(context).pop();
              },
              label: const Text(
                "Slide to cancel Event",
                style: TextStyle(
                    color: Color(0xff4a4a4a),
                    fontWeight: FontWeight.w500,
                    fontSize: 17),
              ),
              icon: const Text(
                "x",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 44,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SliderButton(
              action: () {},

              label: const Text(
                "Slide to cancel !",
                style: TextStyle(
                    color: Color(0xff4a4a4a),
                    fontWeight: FontWeight.w500,
                    fontSize: 17),
              ),
              icon: const Center(
                  child: Icon(
                Icons.power_settings_new,
                color: Colors.white,
                size: 40.0,
                semanticLabel: 'Text to announce in accessibility modes',
              )),

              ///Change All the color and size from here.
              width: 230,
              radius: 10,
              buttonColor: const Color(0xffd60000),
              backgroundColor: const Color(0xff534bae),
              highlightedColor: Colors.white,
              baseColor: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
