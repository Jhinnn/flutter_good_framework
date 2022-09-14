import 'package:flutter/material.dart';
import 'package:good_framework/a_plugins/listview/scrollable_positioned_list/div_scroll_widget.dart';
import 'package:good_framework/a_plugins/listview/scrollable_positioned_list/scroll_widget.dart';

class ScrollablePositionedListDemo extends StatefulWidget {
  const ScrollablePositionedListDemo({Key? key}) : super(key: key);

  @override
  State<ScrollablePositionedListDemo> createState() =>
      _ScrollablePositionedListDemoState();
}

class _ScrollablePositionedListDemoState
    extends State<ScrollablePositionedListDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('scroll_positioned_list_demo'),
      ),
      body: Row(
        children: [
          Expanded(
              child: Container(
            alignment: Alignment.center,
            child: TextButton(
              child: const Text('官方demo'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return const ScrollablePositionedListPage();
                }));
              },
            ),
          )),
          Expanded(
              child: Container(
            alignment: Alignment.center,
            child: TextButton(
              child: const Text('div_demo'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return const DivScrollWidget();
                }));
              },
            ),
          )),
        ],
      ),
    );
  }
}
