import 'package:flutter/material.dart';

import '../../../z_widget/div_scaffold.dart';
import 'liquid_circular_progress_indicator_page.dart';
import 'liquid_custom_progress_indicator_page.dart';
import 'liquid_linear_progress_indicator_page.dart';

class LiquidProgressIndicatorDemo extends StatelessWidget {
  const LiquidProgressIndicatorDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return LRScaffold(
      title: 'liquid_progress_indicator_page',
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextButton(
              child: const Text("Circular"),
              // color: Colors.grey[300],
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => LiquidCircularProgressIndicatorPage(),
                ),
              ),
            ),
            TextButton(
              child: const Text("Linear"),
              // color: Colors.grey[300],
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => LiquidLinearProgressIndicatorPage(),
                ),
              ),
            ),
            TextButton(
              child: const Text("Custom"),
              // color: Colors.grey[300],
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => LiquidCustomProgressIndicatorPage(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
