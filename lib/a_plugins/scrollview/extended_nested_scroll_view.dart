import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:good_framework/z_widget/div_scaffold.dart';

class ExtendedNestedScrollViewDemo extends StatelessWidget {
  const ExtendedNestedScrollViewDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LRScaffold(
      title: 'ExtendedNestedScrollViewDemo',
      child: Center(
        child: Text('/Users/felix/Desktop/plugins/scrollview'),
      ),
    );
  }
}
