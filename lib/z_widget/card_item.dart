import 'package:flutter/material.dart';
import 'package:good_framework/z_constants/app_colors.dart';

class CardItem extends StatelessWidget {
  final VoidCallback voidCallback;
  final Widget child;

  const CardItem({Key? key, required this.child, required this.voidCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: voidCallback,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(2, 2),
                    blurRadius: 5)
              ]),
          child: child,
        ),
      ),
    );
  }
}
