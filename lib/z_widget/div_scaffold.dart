import 'package:flutter/material.dart';

class LRScaffold extends StatelessWidget {
  final String title;
  final Widget child;
  const LRScaffold({Key? key, required this.child, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          leading: Container(),
        ),
        
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Icon(Icons.home),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: child,
        ));
  }
}
