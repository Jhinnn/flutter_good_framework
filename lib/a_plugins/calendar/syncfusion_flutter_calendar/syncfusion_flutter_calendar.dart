import 'package:flutter/material.dart';

import '../../../z_widget/div_scaffold.dart';

class SyncfusionFlutterCalendarDemo extends StatefulWidget {
  const SyncfusionFlutterCalendarDemo({Key? key}) : super(key: key);

  @override
  State<SyncfusionFlutterCalendarDemo> createState() =>
      _SyncfusionFlutterCalendarDemoState();
}

class _SyncfusionFlutterCalendarDemoState
    extends State<SyncfusionFlutterCalendarDemo> {
  @override
  Widget build(BuildContext context) {
    return const LRScaffold(
      title: 'SyncfusionFlutterCalendarDemo',
      child: Center(
        child: Text('/Users/felix/Desktop/plugins/calendar'),
      ),
    );
  }
}
