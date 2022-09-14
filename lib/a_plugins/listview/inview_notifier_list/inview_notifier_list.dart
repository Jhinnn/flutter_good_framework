import 'package:flutter/material.dart';

import 'csv_example.dart';
import 'my_list.dart';
import 'video_list.dart';

class InviewNotifierDemo extends StatefulWidget {
  const InviewNotifierDemo({super.key});

  @override
  _InviewNotifierDemoState createState() => _InviewNotifierDemoState();
}

class _InviewNotifierDemoState extends State<InviewNotifierDemo> {
  final List<Tab> myTabs = const <Tab>[
    Tab(text: 'Example 1'),
    Tab(text: 'Example 2'),
    Tab(text: 'Autoplay Video'),
    Tab(text: 'Custom Scroll View'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          title: const Text('ÍnViewNotifierList'),
          centerTitle: true,
          bottom: TabBar(
            tabs: myTabs,
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            MyList(
              key: const ValueKey("list1"),
              initialInViewIds: ['0'],
              inViewArea: Container(
                height: 1.0,
                color: Colors.redAccent,
              ),
            ),
            MyList(
              initialInViewIds: ['0'],
              inViewPortCondition:
                  (double deltaTop, double deltaBottom, double vpHeight) {
                return (deltaTop < (0.5 * vpHeight) + 100.0 &&
                    deltaBottom > (0.5 * vpHeight) - 100.0);
              },
              inViewArea: Container(
                height: 200.0,
                color: Colors.redAccent.withOpacity(0.2),
              ),
            ),
            VideoList(),
            const CSVExample(),
          ],
        ),
      ),
    );
  }
}
