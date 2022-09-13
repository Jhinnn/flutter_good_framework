import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../z_widget/div_scaffold.dart';

class FlutterSmartDialogDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LRScaffold(
      title: 'flutter_smart_dialog',
      child: Container(
        margin: EdgeInsets.all(30),
        child: Wrap(spacing: 20, children: [
          //toast
          ElevatedButton(
            onPressed: () => _showToast(),
            child: Text('showToast'),
          ),

          //loading
          ElevatedButton(
            onPressed: () => _showLoading(),
            child: Text('showLoading'),
          ),

          //dialog
          ElevatedButton(
            onPressed: () => _show(),
            child: Text('show'),
          ),

          //attach
          ElevatedButton(
            onPressed: () => _showAttach(context),
            child: Text('showAttach'),
          ),

          //attach
          ElevatedButton(
            onPressed: () => _bindPage(context),
            child: Text('bindPage'),
          ),
        ]),
      ),
    );
  }

  void _showToast() async {
    await SmartDialog.showToast('test toast');
    print('--------------------------');
  }

  void _show() {
    SmartDialog.show(builder: (_) {
      return Container(
        height: 80,
        width: 180,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Text(
          'easy custom dialog',
          style: TextStyle(color: Colors.white),
        ),
      );
    });
  }

  void _showAttach(BuildContext ctx) {
    var attachDialog = (BuildContext context) {
      SmartDialog.showAttach(
        targetContext: context,
        alignment: Alignment.bottomCenter,
        animationType: SmartAnimationType.scale,
        scalePointBuilder: (selfSize) => Offset(selfSize.width, 0),
        builder: (_) {
          return Container(height: 50, width: 30, color: Colors.red);
        },
      );
    };

    //target widget
    SmartDialog.show(
      useSystem: true,
      builder: (_) {
        return Container(
          height: 300,
          width: 500,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          alignment: Alignment.center,
          child: Builder(builder: (context) {
            return ElevatedButton(
              onPressed: () => attachDialog(context),
              child: Text('target widget'),
            );
          }),
        );
      },
    );
  }

  void _bindPage(BuildContext ctx) {
    //target widget
    SmartDialog.show(
      bindPage: true,
      builder: (_) {
        return Container(
          height: 300,
          width: 500,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          alignment: Alignment.center,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(ctx, MaterialPageRoute(builder: (_) {
                return Scaffold(
                  appBar: AppBar(
                    title: Text("New Page"),
                  ),
                  body: Center(child: Text("New Page")),
                );
              }));
            },
            child: Text('to new page'),
          ),
        );
      },
    );
  }

  void _showLoading() async {
    SmartDialog.showLoading();
    await Future.delayed(Duration(seconds: 2));
    SmartDialog.dismiss();
  }
}
