import 'package:flutter/material.dart';

class RowContentWidget extends StatelessWidget {
  const RowContentWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          color: Colors.black26,
          child: Row(
            children: [
              Container(
                  width: 100,
                  height: 40,
                  color: Colors.lightBlue,
                  alignment: Alignment.center,
                  child: const Text(" hello world ")),
              const SizedBox(
                width: 30,
              ),
              Container(
                  width: 100,
                  height: 40,
                  color: Colors.lightBlue,
                  alignment: Alignment.center,
                  child: const Text(" hello world ")),
            ],
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                width: 100,
                height: 40,
                color: Colors.lightBlue,
                alignment: Alignment.center,
                child: const Text(" hello world ")),
            Container(
                width: 100,
                height: 40,
                color: Colors.lightBlue,
                alignment: Alignment.center,
                child: const Text(" hello world ")),
          ],
        ),
      ],
    );
  }
}

