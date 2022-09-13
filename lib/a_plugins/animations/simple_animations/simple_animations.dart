import 'package:flutter/material.dart';
import 'package:good_framework/z_widget/div_scaffold.dart';
import 'package:simple_animations/simple_animations.dart';

import '../../../z_constants/constants.dart';
import '../../../z_model/plugins_model.dart';

class SimpleAnimations extends StatefulWidget {
 
  const SimpleAnimations({Key? key,})
      : super(key: key);

  @override
  State<SimpleAnimations> createState() => AutoAnimatedState();
}

class AutoAnimatedState extends State<SimpleAnimations> {
  @override
  Widget build(BuildContext context) {
    return LRScaffold(
      title: 'Simple',
      child: SingleChildScrollView(
        child: Column(
          children: [
            
            Column(
              children: [
                playAnimation(),
                const SizedBox(
                  height: 40,
                ),
                loopAnimation(),
                const SizedBox(
                  height: 40,
                ),
                mirrorAnimation(),
                const SizedBox(
                  height: 40,
                ),
                customAnimation(),
                const SizedBox(
                  height: 40,
                ),
                const CustomAnimationTwo(),
                const SizedBox(
                  height: 40,
                ),
                const TimelineTweenAnimation(),
                const SizedBox(
                  height: 40,
                ),
                const TimelineTweenTowAnimation(),
                const SizedBox(
                  height: 40,
                ),
                const TimelineTweenThreeAnimation(),
                const SizedBox(
                  height: 40,
                ),
                const AnimationControllerAnimate()
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget playAnimation() {
    return PlayAnimation<double>(
      tween: Tween(begin: 30.0, end: 100.0),
      duration: const Duration(seconds: 2),
      delay: const Duration(seconds: 1),
      curve: Curves.easeOut,
      builder: (context, child, value) {
        return Container(
          width: value,
          height: value,
          color: Colors.pink,
        );
      },
    );
  }

  Widget loopAnimation() {
    return LoopAnimation<double>(
      tween: Tween(begin: 0.0, end: 6.0),
      duration: const Duration(seconds: 2),
      curve: Curves.easeOut,
      builder: (context, child, value) {
        return Transform.scale(
          scale: value,
          child: child,
        );
      },
      child: const Text('Hello!'),
    );
  }

  Widget mirrorAnimation() {
    return MirrorAnimation<double>(
      tween: Tween(begin: -100.0, end: 100.0), // value for offset x-coordinate
      duration: const Duration(seconds: 2),
      curve: Curves.easeInOutSine, // non-linear animation
      builder: (context, child, value) {
        return Transform.translate(
          offset: Offset(value, 0), // use animated value for x-coordinate
          child: child,
        );
      },
      child: Container(
        width: 100,
        height: 100,
        color: Colors.green,
      ),
    );
  }

  Widget customAnimation() {
    return CustomAnimation<double>(
      control: CustomAnimationControl.mirror,
      tween: Tween(begin: 100.0, end: 200.0),
      duration: const Duration(seconds: 2),
      delay: const Duration(seconds: 1),
      curve: Curves.easeInOut,
      startPosition: 0.5,
      animationStatusListener: (status) {
        print('status updated: $status');
      },
      builder: (context, child, value) {
        return Container(
            width: value, height: value, color: Colors.blue, child: child);
      },
      child: const Center(
          child: Text(
        'Hello!',
        style: TextStyle(color: Colors.white, fontSize: 24),
      )),
    );
  }
}

class CustomAnimationTwo extends StatefulWidget {
  const CustomAnimationTwo({Key? key}) : super(key: key);

  @override
  _CustomAnimationTwoState createState() => _CustomAnimationTwoState();
}

class _CustomAnimationTwoState extends State<CustomAnimationTwo> {
  CustomAnimationControl control =
      CustomAnimationControl.play; // state variable

  @override
  Widget build(BuildContext context) {
    return CustomAnimation<double>(
      control: control, // bind state variable to parameter
      tween: Tween(begin: -100.0, end: 100.0),
      builder: (context, child, value) {
        return Transform.translate(
          // animation that moves childs from left to right
          offset: Offset(value, 0),
          child: child,
        );
      },
      child: MaterialButton(
        // there is a button
        color: Colors.yellow,
        onPressed:
            toggleDirection, // clicking button changes animation direction
        child: const Text('Swap'),
      ),
    );
  }

  void toggleDirection() {
    // toggle between control instructions
    setState(() {
      control = (control == CustomAnimationControl.play)
          ? CustomAnimationControl.playReverse
          : CustomAnimationControl.play;
    });
  }
}

// Create enum that defines the animated properties
enum AniProps { width, height, color, x, y }

class TimelineTweenAnimation extends StatelessWidget {
  const TimelineTweenAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Specify your tween
    final TimelineTween<AniProps> tween = TimelineTween<AniProps>()
      ..addScene(
              begin: const Duration(milliseconds: 0),
              end: const Duration(milliseconds: 1000))
          .animate(AniProps.width, tween: Tween(begin: 0.0, end: 100.0))
      ..addScene(
              begin: const Duration(milliseconds: 1000),
              end: const Duration(milliseconds: 1500))
          .animate(AniProps.width, tween: Tween(begin: 100.0, end: 200.0))
      ..addScene(
              begin: Duration.zero,
              duration: const Duration(milliseconds: 2500))
          .animate(AniProps.height, tween: Tween(begin: 0.0, end: 200.0))
      ..addScene(
              begin: Duration.zero,
              duration: const Duration(milliseconds: 3000))
          .animate(AniProps.color,
              tween: ColorTween(begin: Colors.red, end: Colors.blue));

    return PlayAnimation<TimelineValue<AniProps>>(
      tween: tween, // Pass in tween
      duration: tween.duration, // Obtain duration
      builder: (context, child, value) {
        return Container(
          width: value.get(AniProps.width), // Get animated value
          height: value.get(AniProps.height),
          color: value.get(AniProps.color),
        );
      },
    );
  }
}

class TimelineTweenTowAnimation extends StatelessWidget {
  const TimelineTweenTowAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Specify your tween
    final tween = TimelineTween<AniProps>()
      ..addScene(begin: Duration.zero, duration: const Duration(seconds: 1))
          .animate(AniProps.x, tween: Tween(begin: -100.0, end: 100.0))
      ..addScene(
              begin: const Duration(seconds: 1),
              duration: const Duration(seconds: 1))
          .animate(AniProps.y, tween: Tween(begin: -100.0, end: 100.0))
      ..addScene(
              begin: const Duration(seconds: 2),
              duration: const Duration(seconds: 1))
          .animate(AniProps.x, tween: Tween(begin: 100.0, end: -100.0))
      ..addScene(
              begin: const Duration(seconds: 3),
              duration: const Duration(seconds: 1))
          .animate(AniProps.y, tween: Tween(begin: 100.0, end: -100.0));

    return Center(
      child: LoopAnimation<TimelineValue<AniProps>>(
        tween: tween, // Pass in tween
        duration: tween.duration, // Obtain duration
        builder: (context, child, value) {
          return Transform.translate(
            // Get animated offset
            offset: Offset(value.get(AniProps.x), value.get(AniProps.y)),
            child: Container(
              width: 100,
              height: 100,
              color: Colors.green,
            ),
          );
        },
      ),
    );
  }
}

class TimelineTweenThreeAnimation extends StatelessWidget {
  const TimelineTweenThreeAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Specify your tween
    final tween = TimelineTween<AniProps>()
      ..addScene(
              begin: const Duration(seconds: 0),
              duration: const Duration(seconds: 1))
          .animate(
            AniProps.x,
            tween: Tween(begin: -100.0, end: 100.0),
            curve: Curves.easeInOutSine,
          )
          .animate(
            AniProps.color,
            tween: ColorTween(begin: Colors.red, end: Colors.yellow),
          )
      ..addScene(
              begin: const Duration(seconds: 1),
              duration: const Duration(seconds: 1))
          .animate(
        AniProps.y,
        tween: Tween(begin: -100.0, end: 100.0),
        curve: Curves.easeInOutSine,
      )
      ..addScene(
              begin: const Duration(seconds: 2),
              duration: const Duration(seconds: 1))
          .animate(
        AniProps.x,
        tween: Tween(begin: 100.0, end: -100.0),
        curve: Curves.easeInOutSine,
      )
      ..addScene(
              begin: const Duration(seconds: 1),
              end: const Duration(seconds: 3))
          .animate(AniProps.color,
              tween: ColorTween(begin: Colors.yellow, end: Colors.blue))
      ..addScene(
              begin: const Duration(seconds: 3),
              duration: const Duration(seconds: 1))
          .animate(
            AniProps.y,
            tween: Tween(begin: 100.0, end: -100.0),
            curve: Curves.easeInOutSine,
          )
          .animate(AniProps.color,
              tween: ColorTween(begin: Colors.blue, end: Colors.red));

    return Center(
      child: LoopAnimation<TimelineValue<AniProps>>(
        tween: tween, // Pass in tween
        duration: tween.duration, // Obtain duration
        builder: (context, child, value) {
          return Transform.translate(
            // Get animated offset
            offset: Offset(value.get(AniProps.x), value.get(AniProps.y)),
            child: Container(
              width: 100,
              height: 100,
              color: value.get(AniProps.color), // Get animated color
            ),
          );
        },
      ),
    );
  }
}

class AnimationControllerAnimate extends StatefulWidget {
  const AnimationControllerAnimate({Key? key}) : super(key: key);

  @override
  _MyAnimatedWidgetState createState() => _MyAnimatedWidgetState();
}

class _MyAnimatedWidgetState extends State<AnimationControllerAnimate>
    with AnimationMixin {
  // declare AnimationControllers
  late AnimationController widthController;
  late AnimationController heightController;
  late AnimationController colorController;

  // declare Animation variables
  late Animation<double> width;
  late Animation<double> height;
  late Animation<Color?> color;

  @override
  void initState() {
    // create controller instances and use mirror animation behavior
    widthController = createController()
      ..mirror(duration: const Duration(seconds: 5));
    heightController = createController()
      ..mirror(duration: const Duration(seconds: 3));
    colorController = createController()
      ..mirror(duration: const Duration(milliseconds: 1500));

    // connect tween with individual controllers
    width = Tween(begin: 100.0, end: 200.0).animate(widthController);
    height = Tween(begin: 100.0, end: 200.0).animate(heightController);
    color = ColorTween(begin: Colors.red, end: Colors.blue)
        .animate(colorController);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.value, //  use animated values
      height: height.value,
      color: color.value,
    );
  }
}
