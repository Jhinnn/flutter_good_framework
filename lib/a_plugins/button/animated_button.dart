import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';

import '../../z_widget/div_scaffold.dart';

class AnimatedButtonDemo extends StatelessWidget {
  const AnimatedButtonDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LRScaffold(
     title: 'AnimatedButtonDemo',
     child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 20),
              AnimatedButton(
                child: const Text(
                  'Simple button',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                color: Colors.blue,
                onPressed: () {},
                enabled: true,
                shadowDegree: ShadowDegree.light,
              ),
              AnimatedButton(
                child: const Text(
                  'Slow animation',
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                color: Colors.green,
                onPressed: () {},
                enabled: true,
                shadowDegree: ShadowDegree.light,
                duration: 400,
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              AnimatedButton(
                child: const Text(
                  'Simple button',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                color: Colors.blue,
                onPressed: () {},
                enabled: true,
                shadowDegree: ShadowDegree.light,
              ),
              AnimatedButton(
                child: const Text(
                  'Navigate to another page',
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: () {
                  // Navigator.of(context)
                  //     .push(MaterialPageRoute(builder: (context) => AnotherPage()));
                },
                width: 300,
                color: Colors.redAccent,
                shadowDegree: ShadowDegree.dark,
                enabled: true,
              ),
              AnimatedButton(
                child: const Text(
                  'I\'m disabled',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: () {
                  print(
                      'you won\'t see this message because button is disabled!');
                },
                color: Colors.green,
                enabled: false,
              ),
              AnimatedButton(
                child: const Text(
                  'Custom height',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: () {},
                height: 40,
                shadowDegree: ShadowDegree.dark,
                color: Colors.indigo,
              ),
              AnimatedButton(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Icon(
                        Icons.add_shopping_cart,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 6),
                      const Text(
                        'Add to Cart',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                onPressed: () {},
                shadowDegree: ShadowDegree.light,
                color: Colors.green,
              ),
              AnimatedButton(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Loading...',
                          style: const TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const SizedBox(
                          width: 30,
                          height: 30,
                          child: const CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  onPressed: () {},
                  shadowDegree: ShadowDegree.light,
                  color: Colors.red),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
