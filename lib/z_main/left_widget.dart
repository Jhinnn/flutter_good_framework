import 'package:flutter/material.dart';
import 'package:good_framework/a_plugins/plugins.dart';
import 'package:provider/provider.dart';
import '../a_base_widget/base_widget.dart';
import '../a_layout_widget/row_widget.dart';
import '../a_scorll_widget/scorll_widget.dart';
import '../z_provider/base_index.dart';

class LeftWidget extends StatefulWidget {
  const LeftWidget({Key? key}) : super(key: key);

  @override
  State<LeftWidget> createState() => _LeftWidgetState();
}

class _LeftWidgetState extends State<LeftWidget> {
  @override
  Widget build(BuildContext context) {
    int mainIndex = context
        .select((IndexProvider indexProvider) => indexProvider.mainIndex);
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: IndexedStack(
          index: mainIndex,
          children: [
            BaseWidget(),
            RowContentWidget(),
            Container(),
            ScrollContentWidget(),
            Plugins()
          ],
        ),
      ),
    );
  }
}
