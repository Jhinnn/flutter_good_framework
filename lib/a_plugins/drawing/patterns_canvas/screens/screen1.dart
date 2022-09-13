import 'package:flutter/material.dart';
import 'package:patterns_canvas/patterns_canvas.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Painting patterns on canvas elements',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Center(
        child: InteractiveViewer(
          constrained: false,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 40.0,
            child: CustomPaint(
              painter: MyPainter(),
            ),
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Prepare the canvas elements to draw on.
    const rect1 = Rect.fromLTWH(30, 50, 125, 75);
    const rect2 = Rect.fromLTWH(30, 150, 125, 75);
    final rRect = RRect.fromLTRBR(30, 250, 155, 325, const Radius.circular(45));

    final rightPath = Path();
    rightPath.lineTo(size.width, size.height / 5);
    rightPath.cubicTo(size.width, size.height / 5, size.width * 0.9,
        size.height * 0.88, size.width * 0.3, size.height * 0.93);
    rightPath.cubicTo(size.width * 0.36, size.height * 0.97, size.width / 5,
        size.height, size.width / 5, size.height);
    rightPath.cubicTo(size.width / 5, size.height, size.width, size.height,
        size.width, size.height);
    rightPath.cubicTo(size.width, size.height, size.width, size.height / 5,
        size.width, size.height / 5);

    final catPath = createCatPath(size);

    // Painting the whole canvas with a pattern:
    const SubtlePatch(bgColor: Colors.white, fgColor: Color(0xffd1dbdd))
        .paintOnCanvas(canvas, size);

    // You can construct a Pattern with three different ways:
    // 1. Directly through a pattern type constructor:
    Pattern p1 = const DiagonalStripesLight(
        bgColor: Colors.yellowAccent, fgColor: Colors.black);
    p1.paintOnRect(canvas, size, rect1);

    // 2. With the Pattern.fromValues factory constructor:
    final Pattern p2 = Pattern.fromValues(
        patternType: PatternType.checkers,
        bgColor: Colors.blueGrey,
        fgColor: Colors.deepOrange);
    p2.paintOnRect(canvas, size, rect2);

    // 3. From a String representation in the form of `pattern_backgroundHex_foregroundHex`:
    final Pattern p3 = Pattern.fromString("verticalThick_e17c05_525252");
    // which can also be drawn on a RRect:
    p3.paintOnRRect(canvas, size, rRect);

    // Or on a Circle:
    const HorizontalStripesThick(
            bgColor: Colors.greenAccent, fgColor: Colors.black)
        .paintOnCircle(canvas, size, const Offset(250, 85), 40.0);

    // You can also set the total number of pattern features to draw, like the number of stripes:
    const HorizontalStripesThick(
            bgColor: Colors.greenAccent,
            fgColor: Colors.black,
            featuresCount: 5)
        .paintOnCircle(canvas, size, const Offset(250, 185), 40.0);

    // You can also control how the pattern scales to its containing element (more on this in the second example):
    const HorizontalStripesThick(
            bgColor: Colors.greenAccent, fgColor: Colors.black)
        .paintOnCircle(canvas, size, const Offset(250, 285), 40.0,
            patternScaleBehavior: PatternScaleBehavior.canvas);

    // Drawing on any kind of Path element:
    const Crosshatch(bgColor: Colors.blueGrey, fgColor: Colors.yellowAccent)
        .paintOnPath(canvas, size, rightPath);
    const Dots(
            bgColor:  Color(0xfffdbf6f), fgColor:  Color(0xff525252))
        .paintOnPath(canvas, size, catPath,
            patternScaleBehavior: PatternScaleBehavior.customRect,
            customRect:
                Rect.fromLTWH(0, size.height / 2, size.width, size.height / 2));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  Path createCatPath(Size size) {
    const w = 155;
    const h = 160;
    Path catBodyPath = Path();
    catBodyPath.lineTo(w * 0.63, h * 0.05);
    catBodyPath.cubicTo(
        w * 0.63, h * 0.05, w * 0.61, h * 0.19, w * 0.61, h * 0.19);
    catBodyPath.cubicTo(
        w * 0.61, h * 0.19, w * 0.57, h * 0.24, w * 0.57, h * 0.31);
    catBodyPath.cubicTo(
        w * 0.57, h * 0.38, w * 0.63, h * 0.43, w * 0.63, h * 0.43);
    catBodyPath.cubicTo(
        w * 0.48, h * 0.43, w * 0.29, h * 0.6, w * 0.29, h * 0.83);
    catBodyPath.cubicTo(
        w * 0.29, h * 0.87, w * 0.29, h * 0.9, w * 0.29, h * 0.92);
    catBodyPath.cubicTo(
        w * 0.23, h * 0.88, w * 0.18, h * 0.78, w * 0.18, h * 0.67);
    catBodyPath.cubicTo(
        w * 0.18, h * 0.55, w * 0.3, h * 0.24, w * 0.3, h * 0.19);
    catBodyPath.cubicTo(w * 0.3, h * 0.13, w * 0.26, h * 0.09, w / 5, h * 0.09);
    catBodyPath.cubicTo(
        w * 0.14, h * 0.09, w * 0.09, h * 0.13, w * 0.09, h * 0.19);
    catBodyPath.cubicTo(
        w * 0.09, h * 0.22, w * 0.11, h * 0.24, w * 0.14, h * 0.24);
    catBodyPath.cubicTo(w * 0.17, h * 0.24, w * 0.19, h * 0.22, w / 5, h / 5);
    catBodyPath.cubicTo(
        w * 0.18, h * 0.27, w * 0.07, h * 0.56, w * 0.07, h * 0.67);
    catBodyPath.cubicTo(
        w * 0.07, h * 0.88, w / 5, h * 1.05, w * 0.38, h * 1.05);
    catBodyPath.cubicTo(
        w * 0.38, h * 1.05, w * 0.39, h * 1.05, w * 0.39, h * 1.05);
    catBodyPath.cubicTo(
        w * 0.39, h * 1.05, w * 0.73, h * 1.05, w * 0.73, h * 1.05);
    catBodyPath.cubicTo(
        w * 0.73, h * 1.05, w * 0.95, h * 1.05, w * 0.95, h * 1.05);
    catBodyPath.cubicTo(
        w * 0.95, h * 1.05, w * 1.02, h * 0.43, w * 1.02, h * 0.43);
    catBodyPath.cubicTo(
        w * 1.02, h * 0.43, w * 1.07, h * 0.38, w * 1.07, h * 0.31);
    catBodyPath.cubicTo(
        w * 1.07, h * 0.24, w * 1.04, h * 0.19, w * 1.04, h * 0.19);
    catBodyPath.cubicTo(
        w * 1.04, h * 0.19, w * 1.02, h * 0.05, w * 1.02, h * 0.05);
    catBodyPath.cubicTo(
        w * 1.02, h * 0.05, w * 0.93, h * 0.12, w * 0.93, h * 0.12);
    catBodyPath.cubicTo(
        w * 0.89, h * 0.1, w * 0.82, h * 0.1, w * 0.82, h * 0.1);
    catBodyPath.cubicTo(
        w * 0.82, h * 0.1, w * 0.77, h * 0.1, w * 0.71, h * 0.12);
    catBodyPath.cubicTo(
        w * 0.71, h * 0.12, w * 0.63, h * 0.05, w * 0.63, h * 0.05);
    catBodyPath.cubicTo(
        w * 0.63, h * 0.05, w * 0.63, h * 0.05, w * 0.63, h * 0.05);
    final catPath = Path()
      ..addPath(catBodyPath, Offset(20.0, size.height - 260));
    return catPath;
  }
}
