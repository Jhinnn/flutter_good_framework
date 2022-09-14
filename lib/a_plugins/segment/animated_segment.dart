import 'package:animated_segment/segment_animation.dart';
import 'package:flutter/material.dart';

import '../../z_widget/div_scaffold.dart';

class AnimatedSegmentDemo extends StatefulWidget {
  const AnimatedSegmentDemo({
    Key? key,
  }) : super(key: key);

  @override
  State<AnimatedSegmentDemo> createState() => _AnimatedSegmentDemoState();
}

class _AnimatedSegmentDemoState extends State<AnimatedSegmentDemo>
    with TickerProviderStateMixin {
  final List<String> _listOfSegments = [
    'Strings.tab_1',
    'Strings.tab_2',
    'Strings.tab_3',
  ];

  @override
  Widget build(BuildContext context) {
    return LRScaffold(
      title: 'segment_animation',
      child: Container(
        alignment: Alignment.center,
        color: AppColors.white,
        child: AnimatedSegment(
          segmentNames: _listOfSegments,
          onSegmentChanged: (index) {
            print('Selected Segment is: ${_listOfSegments[index]}');
          },
          initialSegment: 1,
          backgroundColor: AppColors.bgColor,
          segmentTextColor: AppColors.white,
          rippleEffectColor: AppColors.primary,
          selectedSegmentColor: AppColors.primary,
        ),
      ),
    );
  }
}
