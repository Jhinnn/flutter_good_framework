import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';

class ListViewContentWidget extends StatefulWidget {
  const ListViewContentWidget({Key? key}) : super(key: key);

  @override
  _DragState createState() => _DragState();
}

class _DragState extends State<ListViewContentWidget> {
  
  int index = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[],
    );
  }
}
