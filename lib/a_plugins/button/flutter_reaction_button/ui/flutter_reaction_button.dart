import 'package:flutter/material.dart';


import '../../../../z_widget/div_scaffold.dart';
import '../data/example_data.dart' as Example;
import 'common/item.dart';
import 'common/item_container.dart';

class ReactionButtonButton extends StatelessWidget {
  const ReactionButtonButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LRScaffold(
      title: 'ReactionButtonButton',
      child: Builder(
        builder: (_) {
          return ListView(
            padding: const EdgeInsets.symmetric(vertical: 5),
            children: [
              Item(
                'image 1',
                'assets/images/img1.jpg',
                Example.reactions,
              ),
              ItemContainer(
                'assets/images/img1.jpg',
                Example.reactions,
              ),
              Item(
                'image 2',
                'assets/images/img2.jpg',
                Example.reactions,
              ),
              ItemContainer(
                'assets/images/img2.jpg',
                Example.reactions,
              ),
              Item(
                'image 3',
                'assets/images/img3.jpg',
                Example.reactions,
              ),
              ItemContainer(
                'assets/images/img3.jpg',
                Example.reactions,
              ),
              Item(
                'image 4',
                'assets/images/img4.jpg',
                Example.reactions,
              ),
              ItemContainer(
                'assets/images/img4.jpg',
                Example.reactions,
              ),
              Item(
                'image 5',
                'assets/images/img5.jpg',
                Example.reactions,
              ),
              ItemContainer(
                'assets/images/img5.jpg',
                Example.reactions,
              ),
            ],
          );
        },
      ),
    );
  }
}
