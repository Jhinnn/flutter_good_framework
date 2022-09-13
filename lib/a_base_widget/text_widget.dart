import 'package:flutter/material.dart';
import 'package:good_framework/z_constants/constants.dart';

class TextContentWidget extends StatelessWidget {
  const TextContentWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("Hello world",
            textAlign: TextAlign.left, style: AppTextStyles.normalStyle),
        SizedBox(
          width: 550,
          child: Text("Hello world Flutter!. " * 4,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.titleStyle),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Hello world",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  height: 1.2,
                  fontWeight: FontWeight.bold,
                  fontFamily: "AaLieHuoXingKai",
                  background: Paint()..color = Colors.blue,
                  decoration: TextDecoration.overline,
                  decorationStyle: TextDecorationStyle.dotted),
            ),
            Text(
              "Hello world",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18.0,
                  height: 1.2,
                  fontWeight: FontWeight.bold,
                  fontFamily: "AaLieHuoXingKai",
                  background: Paint()..color = Colors.yellow,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.dashed),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              "Hello world",
              style:
                  TextStyle(fontFamily: 'JinNianYeYaoJiaYouYa', fontSize: 20),
            ),
            Text(
              "Hello world",
              style: TextStyle(
                  fontFamily: 'QingNiaoHuaGuangXingKai', fontSize: 20),
            ),
            Text(
              "Hello world",
              style: TextStyle(fontFamily: 'AaLieHuoXingKai', fontSize: 20),
            ),
            Text(
              "Hello world",
              style: TextStyle(fontFamily: 'Ngaan', fontSize: 20),
            ),
          ],
        ),
        DefaultTextStyle(
          //1.设置文本默认样式
          style: const TextStyle(
            color: Colors.red,
            fontSize: 24.0,
          ),
          textAlign: TextAlign.start,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text("hello world"),
              Text("I am Jack"),
              Text(
                "who are you",
                style: TextStyle(
                    inherit: false, //2.不继承默认样式
                    color: Colors.pink),
              ),
            ],
          ),
        )
      ],
    );
  }
}
