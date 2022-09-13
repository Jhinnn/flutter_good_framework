
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:good_framework/z_widget/div_scaffold.dart';

import '../../group_button.dart';

class GenericsExample extends StatelessWidget {
  GenericsExample({Key? key}) : super(key: key);

  final controller = GroupButtonController(
    selectedIndex: 0,
    onDisablePressed: (i) => print('Button #$i is disabled'),
  );

  final day = DateTime(2022, 4, 9);

  @override
  Widget build(BuildContext context) {
    return LRScaffold(
      title: 'GenericsExample',
      child: Center(
        child: GroupButton<DateTime>(
          controller: controller,
          buttons: List.generate(18, (i) => day.add(Duration(days: i))),
          onSelected: (date, i, selected) =>
              debugPrint('Button: $date index: $i selected: $selected'),
          buttonBuilder: (selected, date, context) {
            return Card(
              color: selected ? Colors.amber[900] : Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${date.year}-${date.month}-${date.day}',
                  style: TextStyle(
                    color: selected ? Colors.white : Colors.black,
                  ),
                ),
              ),
            );
          },
        ),
        
      ),
    );
  }
}
