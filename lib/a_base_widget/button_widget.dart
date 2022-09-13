import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:good_framework/z_constants/app_colors.dart';

class ButtonContentWidget extends StatelessWidget {
  const ButtonContentWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text("normal"),
              onPressed: () {},
            ),
            TextButton(
              child: const Text("normal"),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.thumb_up),
              onPressed: () {},
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.send),
              label: const Text("发送"),
              onPressed: () {},
            ),
            TextButton.icon(
              icon: const Icon(Icons.info),
              label: const Text("详情"),
              onPressed: () {},
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ///ios风格按钮
            CupertinoButton(
              padding: EdgeInsets.zero,
              child: Container(
                height: 40,
                width: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: const Text(
                  'Cupertino',
                  style: TextStyle(color: Colors.red),
                ),
              ),
              onPressed: () {},
            ),
            //
            ElevatedButton(
              style: ButtonStyle(
                  textStyle:
                      MaterialStateProperty.all(const TextStyle(fontSize: 16)),
                  backgroundColor:
                      MaterialStateProperty.all(AppColors.themeColor),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  // side: MaterialStateProperty.all(const BorderSide(
                  //     color: Colors.black, width: 1, style: BorderStyle.solid)),
                  shadowColor: MaterialStateProperty.all(Colors.orange),
                  elevation: MaterialStateProperty.all(2),
                  shape: MaterialStateProperty.all(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                  overlayColor: MaterialStateProperty.all(Colors.red[40]),
                  maximumSize: MaterialStateProperty.all(const Size(120, 50)),
                  fixedSize: MaterialStateProperty.all(const Size(100, 40)),
                  // fixedSize: MaterialStateProperty.all(const Size.fromHeight(44)),
                  // fixedSize: MaterialStateProperty.all(const Size.fromWidth(120)),
                  minimumSize: MaterialStateProperty.all(
                    const Size(80, 30),
                  )),
              onPressed: () {},
              child: const Text(
                "normal",
              ),
            ),
            TextButton.icon(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  foregroundColor:
                      MaterialStateProperty.all(AppColors.themeColor),
                  side: MaterialStateProperty.all(const BorderSide(
                      color: AppColors.themeColor,
                      width: 1,
                      style: BorderStyle.solid)),
                  shadowColor: MaterialStateProperty.all(Colors.orange),
                  elevation: MaterialStateProperty.all(2),
                  maximumSize: MaterialStateProperty.all(const Size(120, 50)),
                  fixedSize: MaterialStateProperty.all(const Size(100, 40)),
                  // fixedSize: MaterialStateProperty.all(const Size.fromHeight(44)),
                  // fixedSize: MaterialStateProperty.all(const Size.fromWidth(120)),
                  minimumSize: MaterialStateProperty.all(
                    const Size(80, 30),
                  )),
              icon: const Icon(Icons.info),
              label: const Text("详情"),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
