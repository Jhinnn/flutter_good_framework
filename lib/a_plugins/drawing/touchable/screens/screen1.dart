import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:touchable/touchable.dart';

class TouchableScreen1 extends StatefulWidget {
  const TouchableScreen1({Key? key}) : super(key: key);

  @override
  _TouchableScreen1State createState() => _TouchableScreen1State();
}

class _TouchableScreen1State extends State<TouchableScreen1>
    with SingleTickerProviderStateMixin {
  Color color = Colors.orange;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TouchableScreen1')),
      body: AnimatedContainer(
          duration: const Duration(seconds: 1),
          color: color,
          width: double.infinity,
          height: 900,
          child: CustomPaint(
                painter: MyPainter(context, (String circleColor) {
                  setState(() {
                    switch (circleColor) {
                      case 'orange':
                        color = Colors.orange;
                        break;
                      case 'pink':
                        color = Colors.pinkAccent;
                        break;
                      case 'green':
                        color = Colors.green;
                        break;
                      case 'black':
                        color = Colors.black;
                        break;
                      case 'purple':
                        color = Colors.purple;
                        break;
                      case 'grey':
                        color = Colors.grey;
                        break;
                      default:
                        color = Colors.blue;
                    }
                  });
                }),
              ),
          // child: CanvasTouchDetector(
          //   builder: (context) {
          //     return CustomPaint(
          //       painter: MyPainter(context, (String circleColor) {
          //         setState(() {
          //           switch (circleColor) {
          //             case 'orange':
          //               color = Colors.orange;
          //               break;
          //             case 'pink':
          //               color = Colors.pinkAccent;
          //               break;
          //             case 'green':
          //               color = Colors.green;
          //               break;
          //             case 'black':
          //               color = Colors.black;
          //               break;
          //             case 'purple':
          //               color = Colors.purple;
          //               break;
          //             case 'grey':
          //               color = Colors.grey;
          //               break;
          //             default:
          //               color = Colors.blue;
          //           }
          //         });
          //       }),
          //     );
          //   },
          // )),
    ));
  }
}

class MyPainter extends CustomPainter {
  Function(String) setState;
  final BuildContext context;

  MyPainter(this.context, this.setState);

  @override
  void paint(Canvas _canvas, Size size) {
    TouchyCanvas canvas = TouchyCanvas(context, _canvas);

    canvas
        .drawCircle(const Offset(0, 0), 60, Paint()..color = Colors.deepOrange,
            onTapDown: (_) {
      print("orange Circle touched");
      setState('orange');
    });

    canvas.drawLine(
        const Offset(0, 0),
        const Offset(300, 700),
        Paint()
          ..color = Colors.black
          ..strokeWidth = 200
          ..style = PaintingStyle.stroke, onTapDown: (detail) {
      setState('black');
      print("black line touched");
    });

    canvas.drawOval(
        const Rect.fromLTWH(100, 100, 300, 400),
        Paint()
          ..color = Colors.deepPurple
          ..style = PaintingStyle.stroke
          ..strokeWidth = 70, onTapDown: (_) {
      print("purple oval touched");
      setState('purple');
    });

    canvas.drawRect(
        const Rect.fromLTWH(20, 300, 100, 300),
        Paint()
          ..color = Colors.deepOrange
          ..style = PaintingStyle.stroke
          ..strokeWidth = 50, onTapDown: (_) {
      print("orange rect touched");
      setState('orange');
    });

    var paint = Paint()
      ..color = Colors.greenAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    canvas.drawCircle(const Offset(150, 50), 60, paint, onTapDown: (_) {
      print("green Circle touched");
      setState('green');
    });

    canvas.drawCircle(
        const Offset(150, 250), 70, Paint()..color = Colors.lightBlueAccent,
        onTapDown: (_) {
      print('light blue Circle tap down');
      setState('white');
    }, onTapUp: (detail) {
      print('light blue circle tap up');
    });

    canvas.drawArc(
        const Rect.fromLTWH(100, 100, 200, 200),
        -pi,
        -3 * pi / 2,
        true,
        Paint()
          ..strokeWidth = 40
          ..style = PaintingStyle.stroke
          ..color = Colors.pink, onTapDown: (_) {
      print('pink arc touched');
      setState('pink');
    });

    canvas.drawRRect(
        RRect.fromLTRBR(100, 340, 300, 650, const Radius.elliptical(100, 150)),
        Paint()
          ..strokeWidth = 40
          ..color = Colors.grey, onTapDown: (_) {
      setState('grey');
      print("grey RRect touched");
    });

    canvas.drawRRect(
        RRect.fromLTRBR(100 - 20.0, 340 - 20.0, 300 + 20.0, 650 + 20.0,
            const Radius.elliptical(100 + 20.0, 150 + 20.0)),
        Paint()
          ..strokeWidth = 1
          ..style = PaintingStyle.stroke
          ..color = Colors.black, onTapDown: (_) {
      setState('blue');
    });

    canvas.drawPoints(
        PointMode.points,
        [const Offset(129.1, 241.9)],
        Paint()
          ..color = Colors.black
          ..strokeWidth = 10);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
