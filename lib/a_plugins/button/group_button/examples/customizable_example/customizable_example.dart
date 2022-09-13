import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

import '../../group_button.dart';
import 'customizable_example_controller.dart';
import 'widgets/group_button_bottom_panel.dart';

class CustomizableExample extends StatelessWidget {
  CustomizableExample({Key? key}) : super(key: key);
  final controller = GroupButtonController(
    onDisablePressed: (i) => debugPrint('Disable Button #$i pressed'),
  );
  final customizableController = CustomizableExampleController();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: customizableController,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'GroupButton 5.0.0',
            ),
          ),
          body: Center(
            child: GroupButton(
              controller: controller,
              isRadio: false,
              buttons: customizableController.buttons
                  .map((i) => '${i + 1}')
                  .toList(),
              onSelected: (val, i, selected) =>
                  debugPrint('Button: $val index: $i $selected'),
            ),
          ),
          bottomNavigationBar: GroupButtonBottomPanel(
            controller: controller,
            customizableController: customizableController,
          ),
        );
      },
    );
  }
}
