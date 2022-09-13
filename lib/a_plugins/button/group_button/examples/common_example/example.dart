import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:good_framework/z_widget/div_scaffold.dart';

import '../../group_button.dart';

class CommonExample extends StatelessWidget {
  CommonExample({Key? key}) : super(key: key);

  final controller = GroupButtonController(
    selectedIndex: 20,
    selectedIndexes: [0, 1, 2, 3, 4],
    disabledIndexes: [10, 12, 13, 14, 15, 23],
    onDisablePressed: (i) => print('Button #$i is disabled'),
  );

  @override
  Widget build(BuildContext context) {
    return LRScaffold(
      title: 'CommonExample',
      child: Center(
        child: GroupButton(
          controller: controller,
          isRadio: false,
          buttons: List.generate(25, (i) => '${i + 1}'),
          maxSelected: 10,
          onSelected: (val, i, selected) =>
              debugPrint('Button: $val index: $i selected: $selected'),
        ),
        
      ),
    );
  }
}
