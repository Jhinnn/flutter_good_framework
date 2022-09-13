import 'package:flutter/material.dart';
import 'package:good_framework/z_widget/custom_dialog.dart';

class LRUtil {
  static showCommonDialog(BuildContext context, Widget child) {
    showDialog(
        context: context,
        builder: (context) {
          return CustomDialog(
            child: child,
          );
        },
        barrierDismissible: true);
  }
}
