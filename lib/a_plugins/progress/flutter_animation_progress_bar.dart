import 'package:flutter/material.dart';

import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

import '../../z_widget/div_scaffold.dart';

class FLutterAnimationProgressBarDemo extends StatefulWidget {
  const FLutterAnimationProgressBarDemo({super.key});

  @override
  _FLutterAnimationProgressBarDemoState createState() =>
      _FLutterAnimationProgressBarDemoState();
}

class _FLutterAnimationProgressBarDemoState
    extends State<FLutterAnimationProgressBarDemo> {
  double _currentValue = 0;

  setEndPressed(double value) {
    setState(() {
      _currentValue = value;
    });
  }

  Widget buildFloatingButton(String text, VoidCallback callback) {
    TextStyle roundTextStyle =
        const TextStyle(fontSize: 16.0, color: Colors.white);
    return FloatingActionButton(
        child: Text(text, style: roundTextStyle), onPressed: callback);
  }

  @override
  Widget build(BuildContext context) {
    return LRScaffold(
      title: 'flutter_animation_progress_bar',
      child: Column(
        children: [
          SizedBox(
              height: 100,
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Column(children: [
                    FAProgressBar(
                      currentValue: _currentValue,
                      displayText: '%',
                    ),
                    const Spacer(),
                    FAProgressBar(
                      currentValue: _currentValue,
                      size: 25,
                      maxValue: 150,
                      changeColorValue: 100,
                      changeProgressColor: Colors.pink,
                      backgroundColor: Colors.white,
                      progressColor: Colors.lightBlue,
                      animatedDuration: const Duration(milliseconds: 300),
                      direction: Axis.horizontal,
                      verticalDirection: VerticalDirection.up,
                      displayText: 'mph',
                      formatValueFixed: 2,
                    )
                  ]))),
          Container(
              height: 350,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Row(
                  children: <Widget>[
                    FAProgressBar(
                      currentValue: _currentValue,
                      maxValue: 140,
                      size: 40,
                      animatedDuration: const Duration(milliseconds: 400),
                      direction: Axis.vertical,
                      verticalDirection: VerticalDirection.up,
                      borderRadius: BorderRadius.circular(0),
                      border: Border.all(
                        color: Colors.indigo,
                        width: 0.5,
                      ),
                      backgroundColor: Colors.white,
                      progressColor: Colors.green,
                      changeColorValue: 90,
                      changeProgressColor: Colors.red,
                      displayText: '°C',
                    ),
                    const Spacer(),
                    FAProgressBar(
                      maxValue: 140,
                      size: 40,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                      progressColor: const Color(0xff5F4B8B),
                      currentValue: _currentValue,
                      direction: Axis.vertical,
                      verticalDirection: VerticalDirection.down,
                    ),
                    const Spacer(),
                    FAProgressBar(
                      size: 40,
                      progressColor: Colors.black54,
                      backgroundColor: Colors.white,
                      currentValue: _currentValue,
                      animatedDuration: const Duration(milliseconds: 800),
                      direction: Axis.vertical,
                      verticalDirection: VerticalDirection.up,
                    )
                  ],
                ),
              )),
          Container(
              child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Container(
                child: Row(
              children: <Widget>[
                buildFloatingButton("0", () => setEndPressed(0)),
                buildFloatingButton("70", () => setEndPressed(70)),
                buildFloatingButton("80.5", () => setEndPressed(80.5)),
                buildFloatingButton("90.25", () => setEndPressed(90.25)),
                buildFloatingButton("100", () => setEndPressed(100)),
                buildFloatingButton("140", () => setEndPressed(140)),
              ],
            )),
          )),
        ],
      ),
    );
  }
}
