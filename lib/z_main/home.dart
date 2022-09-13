import 'package:flutter/material.dart';

import '../a_plugins/plugins.dart';
import 'left_widget.dart';
import 'right_widget.dart';

class LRHomePage extends StatelessWidget {
  const LRHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Row(
    //   children: const [
    //     Expanded(
    //       flex: 1,
    //       child: RightWidget(),
    //     ),
    //     Expanded(
    //       flex: 4,
    //       child: LeftWidget(),
    //     ),
    //   ],
    // );
    return  Scaffold(
      appBar:AppBar(title: const Text('Home'),),
      body: const Plugins(),
    );
  }
}
