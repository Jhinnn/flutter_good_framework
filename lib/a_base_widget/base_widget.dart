import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:good_framework/z_constants/constants.dart';
import 'package:provider/provider.dart';
import '../z_provider/base_index.dart';
import 'button_widget.dart';
import 'image_widget.dart';
import 'rich_text_widget.dart';
import 'text_widget.dart';
import 'icon_widget.dart';
import 'progress_indicator.dart';
import 'switch_widget.dart';
import 'textfield_widget.dart';

class BaseWidget extends StatefulWidget {
  const BaseWidget({Key? key}) : super(key: key);

  @override
  State<BaseWidget> createState() => _BaseWidgetState();
}

class _BaseWidgetState extends State<BaseWidget> {

  @override
  Widget build(BuildContext context) {
    int baseIndex = context
        .select((IndexProvider indexProvider) => indexProvider.baseIndex);
    return Column(
      children: [
        Expanded(
          flex: 8,
          child: Container(
            width: double.infinity,
            color: Colors.white,
            child: IndexedStack(
              index: baseIndex,
              alignment: AlignmentDirectional.center,
              children: const [
                TextContentWidget(),
                RichTextContentWidget(),
                ButtonContentWidget(),
                ImageContentWidget(),
                IconContentWidget(),
                SwitchAndCheckContentWidget(),
                TextFieldContentWidget(),
                ProgressIndicatorContentWidget()
              ],
            ),
          ),
        ),
        const Divider(
          color: Color.fromARGB(255, 219, 205, 205),
          height: 0.5,
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.white,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: AppStrings.baseWidgets.map((e) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextWidget(
                      text: e,
                      selectd: baseIndex == AppStrings.baseWidgets.indexOf(e),
                      voidCallback: () => context
                          .read<IndexProvider>()
                          .setBaseIndex(AppStrings.baseWidgets.indexOf(e))),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

class TextWidget extends StatelessWidget {
  final String text;
  final bool selectd;
  final VoidCallback voidCallback;
  const TextWidget(
      {Key? key,
      required this.text,
      required this.selectd,
      required this.voidCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: voidCallback,
      child: Container(
        height: 30,
        width: 70,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selectd ? AppColors.themeColor : Colors.blue,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ),
    );
  }
}
