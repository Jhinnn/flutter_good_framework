import 'package:flutter/material.dart';
import 'package:slide_to_confirm/slide_to_confirm.dart';

import '../../../z_widget/div_scaffold.dart';

class SilderToConfirmDemo extends StatefulWidget {
  const SilderToConfirmDemo({Key? key}) : super(key: key);
  @override
  _SilderToConfirmDemoState createState() => _SilderToConfirmDemoState();
}

class _SilderToConfirmDemoState extends State<SilderToConfirmDemo> {
  int _counter = 0;

  void confirm() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LRScaffold(
      title: 'SilderToConfirmDemo',
      child: Stack(
        children: <Widget>[
          Container(
            color: Colors.blueAccent.withOpacity(0.5),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Center(
                child: Text(
                  _counter.toString(),
                  style: const TextStyle(
                    fontSize: 38,
                    color: Colors.white,
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 50, bottom: 100),
                  child: ConfirmationSlider(
                    onConfirmation: () => confirm(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
