import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

import '../../../z_widget/div_scaffold.dart';

class LiquidCircularProgressIndicatorPage extends StatelessWidget {
  const LiquidCircularProgressIndicatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LRScaffold(
      title: "Liquid Circular Progress Indicators",
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _AnimatedLiquidCircularProgressIndicator(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                width: 75,
                height: 75,
                child: LiquidCircularProgressIndicator(
                  backgroundColor: Colors.black,
                  valueColor: const AlwaysStoppedAnimation(Colors.red),
                ),
              ),
              SizedBox(
                width: 75,
                height: 75,
                child: LiquidCircularProgressIndicator(
                  backgroundColor: Colors.white,
                  valueColor: const AlwaysStoppedAnimation(Colors.pink),
                  borderColor: Colors.red,
                  borderWidth: 5.0,
                  direction: Axis.horizontal,
                ),
              ),
              SizedBox(
                width: 75,
                height: 75,
                child: LiquidCircularProgressIndicator(
                  backgroundColor: Colors.white,
                  valueColor: const AlwaysStoppedAnimation(Colors.grey),
                  borderColor: Colors.blue,
                  borderWidth: 5.0,
                  center: const Text(
                    "Loading...",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 75,
                height: 75,
                child: LiquidCircularProgressIndicator(
                  backgroundColor: Colors.lightGreen,
                  valueColor: const AlwaysStoppedAnimation(Colors.blueGrey),
                  direction: Axis.horizontal,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AnimatedLiquidCircularProgressIndicator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>
      _AnimatedLiquidCircularProgressIndicatorState();
}

class _AnimatedLiquidCircularProgressIndicatorState
    extends State<_AnimatedLiquidCircularProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );

    _animationController.addListener(() => setState(() {}));
    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final percentage = _animationController.value * 100;
    return Center(
      child: SizedBox(
        width: 150.0,
        height: 150.0,
        child: LiquidCircularProgressIndicator(
          value: _animationController.value,
          backgroundColor: Colors.white,
          valueColor: const AlwaysStoppedAnimation(Colors.blue),
          center: Text(
            "${percentage.toStringAsFixed(0)}%",
            style: const TextStyle(
              color: Colors.lightBlueAccent,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
