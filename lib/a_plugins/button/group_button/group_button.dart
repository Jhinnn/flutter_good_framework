import 'package:flutter/material.dart';
import '../../../z_constants/app_routes.dart';
import '../../../z_widget/div_scaffold.dart';

class GroupButtonDemo extends StatelessWidget {
  const GroupButtonDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LRScaffold(
      title: 'ReactionButtonButton',
      child: SingleChildScrollView(
          child: Column(
        children: [
            ListTile(
              title: const Text('GroupButtonExtendedExample'),
              onTap: () => Navigator.of(context).pushNamed(
                Routes.groupButtonExtendedExample,
              ),
            ),
            ListTile(
              title: const Text('StylesExample'),
              onTap: () => Navigator.of(context).pushNamed(
                Routes.stylesExample,
              ),
            ),
            ListTile(
              title: const Text('CustomizableExample'),
              onTap: () => Navigator.of(context).pushNamed(
                Routes.customizableExample,
              ),
            ),
            ListTile(
              title: const Text('ButtonBuilderExample'),
              onTap: () => Navigator.of(context).pushNamed(
                Routes.buttonBuilderExample,
              ),
            ),
            ListTile(
              title: const Text('FullOptionsSelectedExample'),
              onTap: () => Navigator.of(context).pushNamed(
                Routes.fullOptionsSelectedExample,
              ),
            ),
            ListTile(
              title: const Text('GenericsExample'),
              onTap: () => Navigator.of(context).pushNamed(
                Routes.genericsExample,
              ),
            ),
            ListTile(
              title: const Text('CommonExample'),
              onTap: () => Navigator.of(context).pushNamed(
                Routes.commonExample,
              ),
            ),

          ListTile(
            title: const Text('GroupButtonProviderExample'),
            onTap: () => Navigator.of(context).pushNamed(
              Routes.groupButtonProviderExample,
            ),
          ),

            
        ],
      )),
    );
    
  }
}
