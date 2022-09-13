import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../../../z_widget/div_scaffold.dart';
import 'screens/breadcrumbs_demo_screen.dart';
import 'screens/custom_theme_demo_screen.dart';
import 'screens/simple_demo_screen.dart';

class FlieSystemPickerDemo extends StatefulWidget {
  const FlieSystemPickerDemo({Key? key}) : super(key: key);

  @override
  State<FlieSystemPickerDemo> createState() => _FlieSystemPickerDemoState();
}

class _FlieSystemPickerDemoState extends State<FlieSystemPickerDemo> {
  @override
  void initState() {
    super.initState();

    _prepareStore();
  }

  void _prepareStore() async {
    final Directory rootPath = await getTemporaryDirectory();

    // Create sample directory if not exists
    Directory sampleFolder = Directory('${rootPath.path}/Sample folder');
    if (!sampleFolder.existsSync()) {
      sampleFolder.createSync();
    }

    // Create sample file if not exists
    File sampleFile = File('${sampleFolder.path}/Sample.txt');
    if (!sampleFile.existsSync()) {
      sampleFile.writeAsStringSync('FileSystem Picker sample file.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const StartScreen();
  }
}

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LRScaffold(
      title: 'FlieSystemPickerDemo',
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  child: const Text('Simple Demo'),
                  onPressed: () => Navigator.maybeOf(context)?.push(
                    MaterialPageRoute(
                      builder: (context) => SimpleDemoScreen(),
                    ),
                  ),
                ),

                //
                const SizedBox(height: 24),

                //
                ElevatedButton(
                  child: const Text('Custom Theme Demo'),
                  onPressed: () => Navigator.maybeOf(context)?.push(
                    MaterialPageRoute(
                      builder: (context) => CustomThemeDemoScreen(),
                    ),
                  ),
                ),

                //
                const SizedBox(height: 24),

                //
                ElevatedButton(
                  child: const Text('Breadcrumbs Demo'),
                  onPressed: () => Navigator.maybeOf(context)?.push(
                    MaterialPageRoute(
                      builder: (context) => const BreadcrumbsDemoScreen(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
