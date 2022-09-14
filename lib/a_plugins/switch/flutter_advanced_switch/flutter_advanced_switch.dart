import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';

import '../../../z_widget/div_scaffold.dart';
// import 'package:flutter_icons/flutter_icons.dart';

class FlutterAdvancedSwitchDemo extends StatefulWidget {
  const FlutterAdvancedSwitchDemo({super.key});

  @override
  _FlutterAdvancedSwitchDemoState createState() =>
      _FlutterAdvancedSwitchDemoState();
}

class _FlutterAdvancedSwitchDemoState extends State<FlutterAdvancedSwitchDemo> {
  final _controller00 = ValueNotifier<bool>(false);
  final _controller01 = ValueNotifier<bool>(false);
  final _controller02 = ValueNotifier<bool>(false);
  final _controller03 = ValueNotifier<bool>(false);
  final _controller04 = ValueNotifier<bool>(false);
  final _controller05 = ValueNotifier<bool>(false);
  final _controller06 = ValueNotifier<bool>(false);
  final _controller07 = ValueNotifier<bool>(false);
  final _controller08 = ValueNotifier<bool>(false);
  final _controller09 = ValueNotifier<bool>(false);
  final _controller10 = ValueNotifier<bool>(false);
  final _controller11 = ValueNotifier<bool>(false);
  final _controller12 = ValueNotifier<bool>(false);
  final _controller13 = ValueNotifier<bool>(false);
  final _controller14 = ValueNotifier<bool>(false);
  final _controller15 = ValueNotifier<bool>(false);

  bool _enabled = false;
  bool _themeDark = false;

  @override
  void initState() {
    super.initState();

    _controller00.addListener(() {
      setState(() {
        if (_controller00.value) {
          _themeDark = true;
        } else {
          _themeDark = false;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return LRScaffold(
      title: 'Advanced Switch Example',
      child: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            vertical: 40,
          ),
          physics: ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildLabel('Switch Theme'),
              AdvancedSwitch(
                controller: _controller00,
                thumb: ValueListenableBuilder<bool>(
                  valueListenable: _controller00,
                  builder: (_, value, __) {
                    return Icon(
                        value ? Icons.lightbulb : Icons.lightbulb_outline);
                  },
                ),
              ),
              UnconstrainedBox(
                child: AdvancedSwitch(
                  controller: _controller01,
                  width: 110,
                  enabled: false,
                  inactiveColor: Colors.red,
                  activeColor: Colors.green,
                  activeChild: Text(
                    'File selected',
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                  ),
                  inactiveChild: Text(
                    'No File Selected',
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              _buildLabel('Default Switch'),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AdvancedSwitch(
                    controller: _controller01,
                  ),
                  SizedBox(width: 25),
                  AdvancedSwitch(
                    controller: _controller01,
                    thumb: ValueListenableBuilder<bool>(
                      valueListenable: _controller01,
                      builder: (_, value, __) {
                        return Icon(
                            value ? Icons.cloud_upload : Icons.cloud_download);
                      },
                    ),
                  ),
                ],
              ),
              _buildLabel('Disabled Switch'),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AdvancedSwitch(
                    enabled: _enabled,
                    controller: ValueNotifier(false),
                  ),
                  SizedBox(width: 25),
                  AdvancedSwitch(
                    enabled: _enabled,
                    controller: ValueNotifier(true),
                  ),
                  SizedBox(width: 25),
                  ElevatedButton(
                    onPressed: () => setState(() => _enabled = !_enabled),
                    child: Text('Enable/Disable'),
                  )
                ],
              ),
              _buildLabel('Color/Icon/Image Switch'),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AdvancedSwitch(
                    activeColor: Colors.yellow,
                    inactiveColor: Colors.indigo,
                    activeChild: Text('Yellow'),
                    inactiveChild: Text('Indigo'),
                    width: 80,
                    controller: _controller03,
                  ),
                  AdvancedSwitch(
                    activeChild: Icon(
                      Icons.terrain,
                      color: Colors.blue,
                    ),
                    inactiveChild: Icon(Icons.cloud),
                    activeColor: Colors.yellowAccent,
                    inactiveColor: Colors.deepPurple,
                    width: 60,
                    controller: _controller15,
                  ),
                  AdvancedSwitch(
                    controller: _controller13,
                    activeImage: AssetImage('assets/images/day_sky.png'),
                    inactiveImage: AssetImage('assets/images/night_sky.jpg'),
                  ),
                  AdvancedSwitch(
                    controller: _controller14,
                    width: 80,
                    activeChild: Text('DAY'),
                    inactiveChild: Text('NIGHT'),
                    activeImage: AssetImage('assets/images/day_sky.png'),
                    inactiveImage: AssetImage('assets/images/night_sky.jpg'),
                  ),
                ],
              ),
              _buildLabel('ON/OFF Switch'),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AdvancedSwitch(
                    activeChild: Text('1'),
                    inactiveChild: Text('0'),
                    width: 70,
                    controller: _controller02,
                  ),
                  AdvancedSwitch(
                    activeChild: Text('ON'),
                    inactiveChild: Text('OFF'),
                    borderRadius: BorderRadius.circular(5),
                    width: 76,
                    controller: _controller04,
                  ),
                  AdvancedSwitch(
                    activeChild: Text('true'),
                    inactiveChild: Text('false'),
                    borderRadius: BorderRadius.zero,
                    width: 76,
                    controller: _controller05,
                  ),
                ],
              ),
              _buildLabel('XXS/XS Switch'),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AdvancedSwitch(
                    width: 16,
                    height: 8,
                    controller: _controller06,
                  ),
                  AdvancedSwitch(
                    width: 32,
                    height: 16,
                    controller: _controller07,
                  ),
                ],
              ),
              _buildLabel('S/M/L Switch'),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AdvancedSwitch(
                    width: 48,
                    height: 24,
                    controller: _controller08,
                  ),
                  AdvancedSwitch(
                    width: 56,
                    height: 28,
                    controller: _controller09,
                  ),
                  AdvancedSwitch(
                    width: 72,
                    height: 36,
                    controller: _controller10,
                    borderRadius: BorderRadius.circular(18),
                  ),
                ],
              ),
              _buildLabel('XL/XXL Switch'),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AdvancedSwitch(
                    width: 96,
                    height: 48,
                    controller: _controller11,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  AdvancedSwitch(
                    width: 112,
                    height: 56,
                    controller: _controller12,
                    borderRadius: BorderRadius.circular(29),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String value) {
    return Container(
      margin: EdgeInsets.only(
        top: 25,
        bottom: 5,
      ),
      child: Text(
        '$value',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Colors.grey,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller01.dispose();
    _controller02.dispose();
    _controller03.dispose();
    _controller04.dispose();
    _controller05.dispose();
    _controller06.dispose();
    _controller07.dispose();
    _controller08.dispose();
    _controller09.dispose();
    _controller10.dispose();
    _controller11.dispose();
    _controller12.dispose();
    _controller13.dispose();
    _controller14.dispose();
    _controller15.dispose();

    super.dispose();
  }
}
