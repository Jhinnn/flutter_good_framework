import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:good_framework/z_constants/app_colors.dart';

class RichTextContentWidget extends StatefulWidget {
  const RichTextContentWidget({Key? key}) : super(key: key);

  @override
  State<RichTextContentWidget> createState() => _RichTextContentWidgetState();
}

class _RichTextContentWidgetState extends State<RichTextContentWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text.rich(TextSpan(children: [
          const TextSpan(text: "王明阳",style: TextStyle(color: AppColors.themeColor)),
          TextSpan(
              text: "#0001",
              style: const TextStyle(color: Colors.black87),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  debugPrint('点击了链接');
                }),
        ])),
        Text.rich(TextSpan(children: [
          const TextSpan(text: "Home: "),
          TextSpan(
              text: "https://flutterchina.club",
              style: const TextStyle(color: Colors.blue),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  debugPrint('点击了链接');
                }),
        ])),
        Text.rich(TextSpan(children: [
          const TextSpan(text: '没有账号？',style: TextStyle(fontSize: 16,color: Colors.black26)),
          TextSpan(
              text: '注册',
              style: const TextStyle(fontSize: 16,color: AppColors.themeColor),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  debugPrint('点击了注册');
                }),
        ])),
        const Text.rich(TextSpan(children: [
          TextSpan(
              text: "￥",
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          TextSpan(
              text: "99",
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 30,
                  fontWeight: FontWeight.bold)),
          TextSpan(
              text: ".00",
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 10,
                  fontWeight: FontWeight.bold)),
        ])),
      ],
    );
  }
}
