import 'package:flutter/material.dart';
import '../../../z_constants/app_routes.dart';
import '../../../z_utils/show_dialog.dart';
import '../../../z_widget/card_item.dart';
import '../../../z_widget/div_scaffold.dart';
import 'container_transition.dart';
import 'fade_scale_transition.dart';
import 'fade_through_transition.dart';
import 'shared_axis_transition.dart';

class AnimationsDemo extends StatelessWidget {
  const AnimationsDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LRScaffold(
        title: 'Animations',
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: const Text('Container transform'),
                subtitle: const Text('OpenContainer'),
                onTap: () => Navigator.of(context).pushNamed(
                  Routes.openContainer,
                ),
              ),
              ListTile(
                title: const Text('Shared axis'),
                subtitle: const Text('SharedAxisTransition'),
                onTap: () => Navigator.of(context).pushNamed(
                  Routes.sharedAxisTransition,
                ),
              ),
              ListTile(
                title: const Text('Fade through'),
                subtitle: const Text('FadeThroughTransition'),
                onTap: () => Navigator.of(context).pushNamed(
                  Routes.fadeThroughTransition,
                ),
              ),
              ListTile(
                title: const Text('Fade'),
                subtitle: const Text('FadeScaleTransition'),
                onTap: () => Navigator.of(context).pushNamed(
                  Routes.fadeScaleTransition,
                ),
              ),
            ],
          ),
        ));
  }
}
