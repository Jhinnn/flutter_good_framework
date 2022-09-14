import 'package:flutter/material.dart';
import 'package:vertical_weight_slider/vertical_weight_slider.dart';

import '../../../z_widget/div_scaffold.dart';

class VerticalWeightSliderDemo extends StatefulWidget {
  const VerticalWeightSliderDemo({Key? key}) : super(key: key);
  @override
  _VerticalWeightSliderDemoState createState() =>
      _VerticalWeightSliderDemoState();
}

class _VerticalWeightSliderDemoState extends State<VerticalWeightSliderDemo> {
  late WeightSliderController _controller;
  double _weight = 30.0;

  @override
  void initState() {
    super.initState();
    _controller = WeightSliderController(
        initialWeight: _weight, minWeight: 0, interval: 0.1);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LRScaffold(
      title: "Vertical Weight Slider Example",
      child: Column(
        children: [
          Container(
            height: 200.0,
            alignment: Alignment.center,
            child: Text(
              "${_weight.toStringAsFixed(1)} kg",
              style: const TextStyle(fontSize: 40.0, fontWeight: FontWeight.w500),
            ),
          ),
          VerticalWeightSlider(
            controller: _controller,
            decoration: const PointerDecoration(
              width: 130.0,
              height: 3.0,
              largeColor: Color(0xFF898989),
              mediumColor: Color(0xFFC5C5C5),
              smallColor: Color(0xFFF0F0F0),
              gap: 30.0,
            ),
            onChanged: (double value) {
              setState(() {
                _weight = value;
              });
            },
            indicator: Container(
              height: 3.0,
              width: 200.0,
              alignment: Alignment.centerLeft,
              color: Colors.red[300],
            ),
          ),
        ],
      ),
    );
  }
}
