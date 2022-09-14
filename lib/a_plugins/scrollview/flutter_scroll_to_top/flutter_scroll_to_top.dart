import 'package:flutter/material.dart';

import '../../../z_widget/div_scaffold.dart';
import 'pages/basic_prompt.dart';
import 'pages/custom_prompt.dart';
import 'pages/nested_scroll_view_example.dart';
import 'pages/themed_prompt.dart';

class FlutterScrollToTopDemo extends StatefulWidget {
  const FlutterScrollToTopDemo({super.key});

  @override
  _FlutterScrollToTopDemoState createState() => _FlutterScrollToTopDemoState();
}

class _FlutterScrollToTopDemoState extends State<FlutterScrollToTopDemo> {
  @override
  Widget build(BuildContext context) {
    return LRScaffold(
        title: 'Scroll to top prompt examples',
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const BasicPrompt(),
                      ));
                    },
                    child: const Text('Basic Prompt'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ThemedPrompt(),
                      ));
                    },
                    child: const Text('Themed Prompt'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CustomPrompt(),
                      ));
                    },
                    child: const Text('Custom Prompt'),
                  ),
                  const Flexible(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                      endIndent: 100,
                      indent: 100,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const NestedScrollViewExample(),
                      ));
                    },
                    child: const Text('NestedScrollView Implementation'),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
