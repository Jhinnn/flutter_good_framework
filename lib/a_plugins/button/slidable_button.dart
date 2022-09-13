import 'package:flutter/material.dart';
import 'package:slidable_button/slidable_button.dart';

import '../../z_widget/div_scaffold.dart';


class SlidableButtonDemo extends StatefulWidget {
  const SlidableButtonDemo({Key? key}) : super(key: key);

  @override
  _SlidableButtonDemoState createState() => _SlidableButtonDemoState();
}

class _SlidableButtonDemoState extends State<SlidableButtonDemo> {
  String result = "Let's slide!";

  @override
  Widget build(BuildContext context) {
    return LRScaffold(
      title: 'SlidableButtonDemo',
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Slide this button to left or right.'),
                      const SizedBox(height: 16.0),
                      HorizontalSlidableButton(
                        initialPosition: SlidableButtonPosition.start,
                        width: MediaQuery.of(context).size.width / 3,
                        buttonWidth: 60.0,
                        color: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.5),
                        buttonColor: Theme.of(context).primaryColor,
                        dismissible: false,
                        label: const Center(child: Text('Slide Me')),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Left'),
                              Text('Right'),
                            ],
                          ),
                        ),
                        onChanged: (position) {
                          setState(() {
                            if (position == SlidableButtonPosition.end) {
                              result = 'Button is at the right';
                            } else {
                              result = 'Button is on the left';
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const VerticalDivider(),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Slide this button to top or bottom.'),
                      const SizedBox(height: 16.0),
                      VerticalSlidableButton(
                        initialPosition: SlidableButtonPosition.start,
                        height: MediaQuery.of(context).size.height / 3,
                        buttonHeight: 60.0,
                        color: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.5),
                        buttonColor: Theme.of(context).primaryColor,
                        dismissible: false,
                        label: const Center(child: Text('Slide Me')),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Top'),
                              Text('Bottom'),
                            ],
                          ),
                        ),
                        onChanged: (position) {
                          setState(() {
                            if (position == SlidableButtonPosition.end) {
                              result = 'Button is at the bottom';
                            } else {
                              result = 'Button is on the top';
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Text('Result:\n$result', textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
