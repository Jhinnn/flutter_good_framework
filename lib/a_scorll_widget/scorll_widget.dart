import 'package:flutter/material.dart';
import 'listview_widget.dart';

class ScrollContentWidget extends StatefulWidget {
  const ScrollContentWidget({Key? key}) : super(key: key);

  @override
  State<ScrollContentWidget> createState() => _LayoutWidgetState();
}

class _LayoutWidgetState extends State<ScrollContentWidget> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: Container(
            width: double.infinity,
            color: Colors.white,
            child: IndexedStack(
              index: index,
              alignment: AlignmentDirectional.center,
              children: [ListViewContentWidget()],
            ),
          ),
        ),
        const Divider(
          color: Color.fromARGB(255, 219, 205, 205),
          height: 0.5,
        ),
        Expanded(
          flex: 1,
          child: Container(
            width: double.infinity,
            color: Colors.white,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
