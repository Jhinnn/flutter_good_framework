import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchAndCheckContentWidget extends StatefulWidget {
  const SwitchAndCheckContentWidget({Key? key}) : super(key: key);

  @override
  _SwitchAndCheckContentWidgetState createState() =>
      _SwitchAndCheckContentWidgetState();
}

class _SwitchAndCheckContentWidgetState
    extends State<SwitchAndCheckContentWidget> {
  bool _switchSelected = true; //维护单选开关状态
  bool _checkboxSelected = true; //维护复选框状态
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Android风格'),
                Switch(
                  value: _switchSelected, //当前状态
                  onChanged: (value) {
                    //重新构建页面
                    setState(() {
                      _switchSelected = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(
              width: 100,
            ),
            Column(
              children: [
                const Text('iOS风格'),
                Transform.scale(
                  scale: 0.6,

                  ///苹果风格Switch
                  child: CupertinoSwitch(
                      activeColor: Colors.green,
                      value: _switchSelected,
                      onChanged: (value) {
                        setState(() {
                          _switchSelected = value;
                        });
                      }),
                ),
              ],
            ),
            const SizedBox(
              width: 100,
            ),
            Text(_switchSelected ? '结果：开' : '结果：关'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(_checkboxSelected ? '选中了' : '未选中'),
            Checkbox(
              value: _checkboxSelected,
              activeColor: Colors.red, //选中时的颜色
              onChanged: (value) {
                setState(() {
                  _checkboxSelected = value!;
                });
              },
            ),
            Checkbox(
              side: BorderSide(
                  color: _checkboxSelected ? Colors.purple : Colors.blue,
                  width: 2),
              value: _checkboxSelected,
              activeColor: Colors.purple, //选中时的框框颜色
              checkColor: Colors.red, //选中是勾勾颜色
              // focusColor: Colors.yellow,
              onChanged: (value) {
                setState(() {
                  _checkboxSelected = value!;
                });
              },
            ),
          ],
        )
      ],
    );
  }
}
