import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final VoidCallback voidCallback;
  const TextWidget({Key? key, required this.text, required this.voidCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: voidCallback,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 70,
          height: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color.fromARGB(255, 46, 140, 93)),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(fontSize: 12, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}