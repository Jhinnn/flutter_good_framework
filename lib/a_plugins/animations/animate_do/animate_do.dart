import 'package:flutter/material.dart';
import 'package:good_framework/z_constants/app_colors.dart';
import 'package:good_framework/z_constants/app_text_styles.dart';
import 'package:good_framework/z_model/plugins_model.dart';
import 'package:animate_do/animate_do.dart';

import '../../../z_widget/circular_widget.dart';
import '../../../z_widget/div_scaffold.dart';
import '../../../z_widget/square_widget.dart';

class AnimateDo extends StatefulWidget {

  const AnimateDo({
    Key? key,
  }) : super(key: key);

  @override
  State<AnimateDo> createState() => _AnimateDoState();
}

class _AnimateDoState extends State<AnimateDo> {
  @override
  Widget build(BuildContext context) {
    return LRScaffold(
      title: 'AnimateDo',
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    FadeInLeft(child: const Square()),
                    FadeInUp(child: const Square()),
                    FadeInDown(child: const Square()),
                    FadeInRight(child: const Square()),
                  ],
                ),
                Column(
                  children: [
                    BounceInDown(child: const Circular()),
                    BounceInUp(child: const Circular()),
                    BounceInLeft(child: const Circular()),
                    BounceInRight(child: const Circular()),
                  ],
                ),
                Column(
                  children: [
                    ElasticIn(child: const Circular()),
                    ElasticInDown(child: const Circular()),
                    ElasticInUp(child: const Circular()),
                    ElasticInLeft(child: const Circular()),
                    ElasticInRight(child: const Circular()),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    SlideInDown(child: const Square()),
                    SlideInUp(child: const Square()),
                    SlideInLeft(child: const Square()),
                    SlideInRight(child: const Square()),
                  ],
                ),
                Column(
                  children: [
                    FlipInX(child: const Circular()),
                    FlipInY(child: const Circular()),
                  ],
                ),
                Column(
                  children: [
                    ZoomIn(child: const Circular()),
                    ZoomOut(child: const Circular()),
                  ],
                ),
                Column(
                  children: [
                    JelloIn(child: const Circular()),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Bounce(
                  child: const Circular(),
                ),
                Flash(
                  child: const Circular(),
                ),
                Pulse(
                  child: const Circular(),
                ),
                Swing(
                  child: const Circular(),
                ),
                Spin(
                  child: const Circular(),
                ),
                Dance(
                  child: const Circular(),
                ),
                SpinPerfect(
                  child: const Circular(),
                ),
                SpinPerfect(
                  child: const Circular(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
