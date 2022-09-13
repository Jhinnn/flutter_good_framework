import 'package:flutter/material.dart';
import 'package:good_framework/a_plugins/drawing/touchable/screens/screen1.dart';
import 'package:good_framework/a_plugins/drawing/touchable/screens/screen2.dart';
import 'package:good_framework/a_plugins/drawing/touchable/screens/screen3.dart';

class TouchableDemo extends StatelessWidget {
  const TouchableDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PatternsCanvasDemo'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            title: const Text('TouchableScreen1'),
            onTap: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const TouchableScreen1();
            })),
          ),
          ListTile(
              title: const Text('TouchableScreen2'),
              onTap: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const TouchableScreen2();
                  }))),
          ListTile(
              title: const Text('TouchableScreen3'),
              onTap: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const TouchableScreen3();
                  }))),
        ],
      ),
    );
  }
}
