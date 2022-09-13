import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:good_framework/z_widget/div_scaffold.dart';

class FullOptionsSelectedExample extends StatelessWidget {
  const FullOptionsSelectedExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LRScaffold(
      title: 'FullOptionsSelectedExample',
      child: Center(
        child: GroupButton(
          buttons: [10, 20, 30, 40, 50, 60, 70, 80, 90, 100],
          options: GroupButtonOptions(
            selectedShadow: const [],
            selectedTextStyle: TextStyle(
              fontSize: 20,
              color: Colors.pink[900],
            ),
            selectedColor: Colors.pink[100],
            unselectedShadow: const [],
            unselectedColor: Colors.amber[100],
            unselectedTextStyle: TextStyle(
              fontSize: 20,
              color: Colors.amber[900],
            ),
            selectedBorderColor: Colors.pink[900],
            unselectedBorderColor: Colors.amber[900],
            borderRadius: BorderRadius.circular(100),
            spacing: 10,
            runSpacing: 10,
            groupingType: GroupingType.wrap,
            direction: Axis.horizontal,
            buttonHeight: 60,
            buttonWidth: 60,
            mainGroupAlignment: MainGroupAlignment.start,
            crossGroupAlignment: CrossGroupAlignment.start,
            groupRunAlignment: GroupRunAlignment.start,
            textAlign: TextAlign.center,
            textPadding: EdgeInsets.zero,
            alignment: Alignment.center,
            elevation: 0,
          ),
          isRadio: false,
        ),
        
      ),
    );
  }
}
