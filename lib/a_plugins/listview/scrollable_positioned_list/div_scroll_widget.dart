import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class DivScrollWidget extends StatefulWidget {
  const DivScrollWidget({Key? key}) : super(key: key);

  @override
  State<DivScrollWidget> createState() => _DivScrollWidgetState();
}

class _DivScrollWidgetState extends State<DivScrollWidget> {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  int _index = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('div_scroll_positioned_list'),
        ),
        backgroundColor: Colors.black26,
        body: Center(
            child: Column(
          children: [
            Container(
                color: Colors.white,
                child: SizedBox(height: 300, child: list())),
            TextButton(
                onPressed: () {
                  itemScrollController.jumpTo(index: 0, alignment: 0.5);
                  setState(() {
                    _index = 0;
                  });
                },
                child: Text("跳转到20"))
          ],
        )));
  }

  Widget list() => ScrollablePositionedList.builder(
        itemCount: 100,
        itemBuilder: itemBuilder,
        itemScrollController: itemScrollController,
        itemPositionsListener: itemPositionsListener,
      );

  Widget itemBuilder(BuildContext context, int index) {
    return MouseRegion(
      onEnter: (event) => setState(() {
        _index = index;
      }),
      child: Container(
        height: 50,
        color: _index == index ? Colors.brown : Colors.transparent,
        child: ListTile(
          title: Text(
            '我是第$index个',
            style: TextStyle(
                fontSize: 14,
                color: _index == index ? Colors.green : Colors.black),
          ),
        ),
      ),
    );
  }
}
