import 'package:flutter/material.dart';
import 'package:patterns_canvas/patterns_canvas.dart';

import 'screens/screen1.dart';
import 'screens/screen2.dart';
import 'screens/screen3.dart';
import 'screens/screen4.dart';
import 'screens/screen5.dart';

class PatternsCanvasDemo extends StatelessWidget {
  const PatternsCanvasDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PatternsCanvasDemo'),),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomPaint(
              size: const Size(200, 200),
              painter: LogoPainter(),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Screen1();
                }));
              },
              child: const Text('Painting patterns on canvas elements'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Screen2();
                }));
              },
              child: const Text('Painting patterns on widgets'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Screen3();
                }));
              },
              child: const Text('All patterns'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Screen4();
                }));
              },
              child: const Text('Scaling settings'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Screen5();
                }));
              },
              child: const Text('Test pad'),
            ),
          ],
        ),
      ),
    );
  }
}

class LogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const Pattern bgPattern = HorizontalStripesThick(
        bgColor: Colors.white, fgColor: Color.fromARGB(255, 157, 27, 27));

    bgPattern.paintOnCircle(
        canvas,
        size,
        Offset(size.width * 0.4834907, size.height * 0.6769141),
        size.width * 0.5000000,
        patternScaleBehavior: PatternScaleBehavior.customRect,
        customRect: const Rect.fromLTWH(0, 0, 500, 500));

    Path path1 = Path();
    path1.moveTo(size.width * 0.3707644, size.height * 0.3520804);
    path1.lineTo(size.width * 0.3707644, size.height * 0.3523300);
    path1.lineTo(size.width * 0.2963180, size.height * 0.3523300);
    path1.lineTo(size.width * 0.2963180, size.height * 1.00);
    path1.lineTo(size.width * 0.4148068, size.height * 1.00);
    path1.lineTo(size.width * 0.4148068, size.height * 0.7623690);
    path1.lineTo(size.width * 0.5403475, size.height * 0.7623690);
    path1.cubicTo(
        size.width * 0.6513337,
        size.height * 0.7243515,
        size.width * 0.7259126,
        size.height * 0.6756977,
        size.width * 0.7246095,
        size.height * 0.5542780);
    path1.cubicTo(
        size.width * 0.7250177,
        size.height * 0.4693757,
        size.width * 0.6913214,
        size.height * 0.3889142,
        size.width * 0.5489984,
        size.height * 0.3530257);
    path1.close();
    const DiagonalStripesThick(
            bgColor: Color(0xff00154f), fgColor: Color(0xfff4af1b))
        .paintOnPath(canvas, size, path1,
            patternScaleBehavior: PatternScaleBehavior.customRect,
            customRect: const Rect.fromLTWH(0, 0, 500, 500));

    Path path2 = Path();
    path2.moveTo(size.width * 0.4151616, size.height * 0.4686700);
    path2.lineTo(size.width * 0.4151616, size.height * 0.6457798);
    path2.lineTo(size.width * 0.5077888, size.height * 0.6457798);
    path2.cubicTo(
        size.width * 0.5684099,
        size.height * 0.6293687,
        size.width * 0.6091453,
        size.height * 0.6083660,
        size.width * 0.6084334,
        size.height * 0.5559528);
    path2.cubicTo(
        size.width * 0.6086554,
        size.height * 0.5193030,
        size.width * 0.5902515,
        size.height * 0.4845699,
        size.width * 0.5125140,
        size.height * 0.4690780);
    path2.lineTo(size.width * 0.4151616, size.height * 0.4686698);
    bgPattern.paintOnPath(canvas, size, path2,
        patternScaleBehavior: PatternScaleBehavior.customRect,
        customRect: const Rect.fromLTWH(0, 0, 500, 500));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
