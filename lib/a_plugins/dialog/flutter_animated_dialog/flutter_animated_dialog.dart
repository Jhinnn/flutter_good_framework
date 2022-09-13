import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import '../../../z_widget/div_scaffold.dart';
import 'model/list_data_model.dart';

class FLutterAnimatedDemo extends StatefulWidget {
  const FLutterAnimatedDemo({Key? key}) : super(key: key);

  @override
  _FLutterAnimatedDemoState createState() => _FLutterAnimatedDemoState();
}

class _FLutterAnimatedDemoState extends State<FLutterAnimatedDemo> {
  // Whether the green box should be visible or invisible

  String selectedIndexText = '';

  int selectIdx = 0;

  String singleSelectedIndexText = '';

  int selectIndex = 0;

  String multiSelectedIndexesText = '';

  List<int> selectedIndexes = [];

  @override
  Widget build(BuildContext context) {
    return LRScaffold(
      title: 'flutter_animated_dialog',
      child: Center(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 10.0),
              padding: const EdgeInsets.only(left: 15.0),
              height: 35.0,
              alignment: Alignment.centerLeft,
              child: const Text('General dialog'),
              color: const Color(0xFFDDDDDD),
            ),
            ListTile(
              title: const Text('Default'),
              onTap: () {
                showAnimatedDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return ClassicGeneralDialogWidget(
                      titleText: 'Title',
                      contentText: 'content',
                      onPositiveClick: () {
                        Navigator.of(context).pop();
                      },
                      onNegativeClick: () {
                        Navigator.of(context).pop();
                      },
                    );
                  },
                );
              },
            ),
            const Divider(
              height: 0.5,
            ),
            ListTile(
              title: const Text(
                "Fade",
              ),
              onTap: () {
                showAnimatedDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return ClassicGeneralDialogWidget(
                      titleText: 'Title',
                      contentText: 'content',
                      onPositiveClick: () {
                        Navigator.of(context).pop();
                      },
                      onNegativeClick: () {
                        Navigator.of(context).pop();
                      },
                    );
                  },
                  animationType: DialogTransitionType.fade,
                  curve: Curves.fastOutSlowIn,
                  duration: const Duration(seconds: 1),
                );
              },
            ),
            const Divider(
              height: 0.5,
            ),
            ListTile(
              title: const Text(
                "Slide from top",
              ),
              onTap: () {
                showAnimatedDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return ClassicGeneralDialogWidget(
                      titleText: 'Title',
                      contentText: 'content',
                      onPositiveClick: () {
                        Navigator.of(context).pop();
                      },
                      onNegativeClick: () {
                        Navigator.of(context).pop();
                      },
                    );
                  },
                  animationType: DialogTransitionType.slideFromTop,
                  curve: Curves.fastOutSlowIn,
                  duration: const Duration(seconds: 1),
                );
              },
            ),
            const Divider(
              height: 0.5,
            ),
            ListTile(
              title: const Text(
                "Slide from top and fade",
              ),
              onTap: () {
                showAnimatedDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return ClassicGeneralDialogWidget(
                      titleText: 'Title',
                      contentText: 'content',
                      onPositiveClick: () {
                        Navigator.of(context).pop();
                      },
                      onNegativeClick: () {
                        Navigator.of(context).pop();
                      },
                    );
                  },
                  animationType: DialogTransitionType.slideFromTopFade,
                  curve: Curves.fastOutSlowIn,
                  duration: const Duration(seconds: 1),
                );
              },
            ),
            const Divider(
              height: 0.5,
            ),
            ListTile(
              title: const Text(
                "Slide from bottom",
              ),
              onTap: () {
                showAnimatedDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return ClassicGeneralDialogWidget(
                      titleText: 'Title',
                      contentText: 'content',
                      onPositiveClick: () {
                        Navigator.of(context).pop();
                      },
                      onNegativeClick: () {
                        Navigator.of(context).pop();
                      },
                    );
                  },
                  animationType: DialogTransitionType.slideFromBottom,
                  curve: Curves.fastOutSlowIn,
                  duration: const Duration(seconds: 1),
                );
              },
            ),
            const Divider(
              height: 0.5,
            ),
            ListTile(
              title: const Text(
                "Slide from bottom and fade",
              ),
              onTap: () {
                showAnimatedDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return ClassicGeneralDialogWidget(
                      titleText: 'Title',
                      contentText: 'content',
                      onPositiveClick: () {
                        Navigator.of(context).pop();
                      },
                      onNegativeClick: () {
                        Navigator.of(context).pop();
                      },
                    );
                  },
                  animationType: DialogTransitionType.slideFromBottomFade,
                  curve: Curves.fastOutSlowIn,
                  duration: const Duration(seconds: 1),
                );
              },
            ),
            const Divider(
              height: 0.5,
            ),
            ListTile(
              title: const Text(
                "Slide from left",
              ),
              onTap: () {
                showAnimatedDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return ClassicGeneralDialogWidget(
                      titleText: 'Title',
                      contentText: 'content',
                      onPositiveClick: () {
                        Navigator.of(context).pop();
                      },
                      onNegativeClick: () {
                        Navigator.of(context).pop();
                      },
                    );
                  },
                  animationType: DialogTransitionType.slideFromLeft,
                  curve: Curves.fastOutSlowIn,
                  duration: const Duration(seconds: 1),
                );
              },
            ),
            const Divider(
              height: 0.5,
            ),
            ListTile(
              title: const Text(
                "Slide from left and fade",
              ),
              onTap: () {
                showAnimatedDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return ClassicGeneralDialogWidget(
                      titleText: 'Title',
                      contentText: 'content',
                      onPositiveClick: () {
                        Navigator.of(context).pop();
                      },
                      onNegativeClick: () {
                        Navigator.of(context).pop();
                      },
                    );
                  },
                  animationType: DialogTransitionType.slideFromLeftFade,
                  curve: Curves.fastOutSlowIn,
                  duration: const Duration(seconds: 1),
                );
              },
            ),
            const Divider(
              height: 0.5,
            ),
            ListTile(
              title: const Text(
                "Slide from right",
              ),
              onTap: () {
                showAnimatedDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return ClassicGeneralDialogWidget(
                      titleText: 'Title',
                      contentText: 'content',
                      onPositiveClick: () {
                        Navigator.of(context).pop();
                      },
                      onNegativeClick: () {
                        Navigator.of(context).pop();
                      },
                    );
                  },
                  animationType: DialogTransitionType.slideFromRight,
                  curve: Curves.fastOutSlowIn,
                  duration: const Duration(seconds: 1),
                );
              },
            ),
            const Divider(
              height: 0.5,
            ),
            ListTile(
              title: const Text(
                "Slide from right and fade",
              ),
              onTap: () {
                showAnimatedDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return ClassicGeneralDialogWidget(
                      titleText: 'Title',
                      contentText: 'content',
                      onPositiveClick: () {
                        Navigator.of(context).pop();
                      },
                      onNegativeClick: () {
                        Navigator.of(context).pop();
                      },
                    );
                  },
                  animationType: DialogTransitionType.slideFromRightFade,
                  curve: Curves.fastOutSlowIn,
                  duration: const Duration(seconds: 1),
                );
              },
            ),
            const Divider(
              height: 0.5,
            ),
            ListTile(
              title: const Text(
                "Scale",
              ),
              onTap: () {
                showAnimatedDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return ClassicGeneralDialogWidget(
                      titleText: 'Title',
                      contentText: 'content',
                      onPositiveClick: () {
                        Navigator.of(context).pop();
                      },
                      onNegativeClick: () {
                        Navigator.of(context).pop();
                      },
                    );
                  },
                  animationType: DialogTransitionType.scale,
                  curve: Curves.fastOutSlowIn,
                  duration: const Duration(seconds: 1),
                );
              },
            ),
            const Divider(
              height: 0.5,
            ),
            ListTile(
              title: const Text(
                "Fade scale",
              ),
              onTap: () {
                showAnimatedDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return ClassicGeneralDialogWidget(
                      titleText: 'Title',
                      contentText: 'content',
                      onPositiveClick: () {
                        Navigator.of(context).pop();
                      },
                      onNegativeClick: () {
                        Navigator.of(context).pop();
                      },
                    );
                  },
                  animationType: DialogTransitionType.fadeScale,
                  curve: Curves.fastOutSlowIn,
                  duration: const Duration(seconds: 1),
                );
              },
            ),
            const Divider(
              height: 0.5,
            ),
            ListTile(
              title: const Text(
                "Scale rotate",
              ),
              onTap: () {
                showAnimatedDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return ClassicGeneralDialogWidget(
                      titleText: 'Title',
                      contentText: 'content',
                      onPositiveClick: () {
                        Navigator.of(context).pop();
                      },
                      onNegativeClick: () {
                        Navigator.of(context).pop();
                      },
                    );
                  },
                  animationType: DialogTransitionType.scaleRotate,
                  curve: Curves.fastOutSlowIn,
                  duration: const Duration(seconds: 1),
                );
              },
            ),
            const Divider(
              height: 0.5,
            ),
            ListTile(
              title: const Text(
                "Rotate",
              ),
              onTap: () {
                showAnimatedDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return ClassicGeneralDialogWidget(
                      titleText: 'Title',
                      contentText: 'content',
                      onPositiveClick: () {
                        Navigator.of(context).pop();
                      },
                      onNegativeClick: () {
                        Navigator.of(context).pop();
                      },
                    );
                  },
                  animationType: DialogTransitionType.rotate,
                  curve: Curves.fastOutSlowIn,
                  duration: const Duration(seconds: 1),
                );
              },
            ),
            const Divider(
              height: 0.5,
            ),
            ListTile(
              title: const Text(
                "Fade rotate",
              ),
              onTap: () {
                showAnimatedDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return ClassicGeneralDialogWidget(
                      titleText: 'Title',
                      contentText: 'content',
                      onPositiveClick: () {
                        Navigator.of(context).pop();
                      },
                      onNegativeClick: () {
                        Navigator.of(context).pop();
                      },
                    );
                  },
                  animationType: DialogTransitionType.fadeRotate,
                  curve: Curves.fastOutSlowIn,
                  duration: const Duration(seconds: 1),
                );
              },
            ),
            const Divider(
              height: 0.5,
            ),
            ListTile(
              title: const Text(
                "Rotate 3D",
              ),
              onTap: () {
                showAnimatedDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return ClassicGeneralDialogWidget(
                      titleText: 'Title',
                      contentText: 'content',
                      onPositiveClick: () {
                        Navigator.of(context).pop();
                      },
                      onNegativeClick: () {
                        Navigator.of(context).pop();
                      },
                    );
                  },
                  animationType: DialogTransitionType.rotate3D,
                  curve: Curves.fastOutSlowIn,
                  duration: const Duration(seconds: 1),
                );
              },
            ),
            const Divider(
              height: 0.5,
            ),
            ListTile(
              title: const Text(
                "Size",
              ),
              onTap: () {
                showAnimatedDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return ClassicGeneralDialogWidget(
                      titleText: 'Title',
                      contentText: 'content',
                      onPositiveClick: () {
                        Navigator.of(context).pop();
                      },
                      onNegativeClick: () {
                        Navigator.of(context).pop();
                      },
                    );
                  },
                  animationType: DialogTransitionType.size,
                  curve: Curves.fastOutSlowIn,
                  duration: const Duration(seconds: 1),
                );
              },
            ),
            const Divider(
              height: 0.5,
            ),
            ListTile(
              title: const Text(
                "Size fade",
              ),
              onTap: () {
                showAnimatedDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return ClassicGeneralDialogWidget(
                      titleText: 'Title',
                      contentText: 'content',
                      onPositiveClick: () {
                        Navigator.of(context).pop();
                      },
                      onNegativeClick: () {
                        Navigator.of(context).pop();
                      },
                    );
                  },
                  animationType: DialogTransitionType.sizeFade,
                  curve: Curves.fastOutSlowIn,
                  duration: const Duration(seconds: 1),
                );
              },
            ),
            const Divider(
              height: 0.5,
            ),
            ListTile(
              title: const Text(
                "No animation",
              ),
              onTap: () {
                showAnimatedDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return ClassicGeneralDialogWidget(
                      titleText: 'Title',
                      contentText: 'content',
                      onPositiveClick: () {
                        Navigator.of(context).pop();
                      },
                      onNegativeClick: () {
                        Navigator.of(context).pop();
                      },
                    );
                  },
                  animationType: DialogTransitionType.none,
                  curve: Curves.fastOutSlowIn,
                  duration: const Duration(seconds: 1),
                );
              },
            ),
            const Divider(
              height: 0.5,
            ),

            ///Classic dialog widget
            Container(
              margin: const EdgeInsets.only(bottom: 10.0, top: 50.0),
              padding: const EdgeInsets.only(left: 15.0),
              height: 35.0,
              alignment: Alignment.centerLeft,
              child: const Text('Classic dialog widget'),
              color: const Color(0xFFDDDDDD),
            ),
            ListTile(
              title: const Text(
                "General dialog",
              ),
              onTap: () {
                showAnimatedDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return ClassicGeneralDialogWidget(
                      titleText: 'Title',
                      contentText: 'This is general dialog.',
                      onPositiveClick: () {
                        Navigator.of(context).pop();
                      },
                      onNegativeClick: () {
                        Navigator.of(context).pop();
                      },
                    );
                  },
                  animationType: DialogTransitionType.size,
                  curve: Curves.linear,
                );
              },
            ),
            const Divider(
              height: 0.5,
            ),
            ListTile(
              title: Text(
                "List dialog ${selectedIndexText != null && selectedIndexText.isNotEmpty ? '(index:' + selectedIndexText + ')' : ''}",
              ),
              onTap: () async {
                int? index = await showAnimatedDialog<int>(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return ClassicListDialogWidget<ListDataModel>(
                      titleText: 'Title',
                      dataList: List.generate(
                        2,
                        (index) {
                          return ListDataModel(
                              name: 'Name$index', value: 'Value$index');
                        },
                      ),
                      onPositiveClick: () {
                        Navigator.of(context).pop();
                      },
                      onNegativeClick: () {
                        Navigator.of(context).pop();
                      },
                    );
                  },
                  animationType: DialogTransitionType.size,
                  curve: Curves.linear,
                );
                selectIdx = index ?? selectIdx;
                print('selectedIndex:$selectIdx');
                setState(() {
                  selectedIndexText = '${selectIdx}';
                });
              },
            ),
            const Divider(
              height: 0.5,
            ),
            ListTile(
              title: Text(
                "List single select${singleSelectedIndexText != null && singleSelectedIndexText.isNotEmpty ? '(index:' + singleSelectedIndexText + ')' : ''}",
              ),
              onTap: () async {
                int? index = await showAnimatedDialog<int>(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return ClassicListDialogWidget<ListDataModel>(
                      titleText: 'Title',
                      listType: ListType.singleSelect,
                      activeColor: Colors.red,
                      selectedIndex: selectIndex,
                      dataList: List.generate(
                        20,
                        (index) {
                          return ListDataModel(
                              name: 'Name$index', value: 'Value$index');
                        },
                      ),
                    );
                  },
                  animationType: DialogTransitionType.size,
                  curve: Curves.linear,
                );
                selectIndex = index ?? selectIndex;

                print('selectedIndex:$selectIndex');
                setState(() {
                  singleSelectedIndexText = '${selectIndex}';
                });
              },
            ),
            const Divider(
              height: 0.5,
            ),
            ListTile(
              title: Text(
                "List multiple select${multiSelectedIndexesText != null && multiSelectedIndexesText.isNotEmpty ? '(index:' + multiSelectedIndexesText + ')' : ''}",
              ),
              onTap: () async {
                List<int>? indexes = await showAnimatedDialog<List<int>>(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return ClassicListDialogWidget<ListDataModel>(
                      titleText: 'Title',
                      listType: ListType.multiSelect,
                      selectedIndexes: selectedIndexes,
                      activeColor: Colors.green,
                      dataList: List.generate(
                        20,
                        (index) {
                          return ListDataModel(
                              name: 'Name$index', value: 'Value$index');
                        },
                      ),
                    );
                  },
                  animationType: DialogTransitionType.size,
                  curve: Curves.linear,
                );

                selectedIndexes = indexes ?? selectedIndexes;
                print('selectedIndex:${selectedIndexes.toString()}');
                setState(() {
                  this.multiSelectedIndexesText =
                      selectedIndexes != null && selectedIndexes.length > 0
                          ? selectedIndexes.toString()
                          : '';
                });
              },
            ),
            const Divider(
              height: 0.5,
            ),
            ListTile(
              title: const Text(
                "Custom dialog",
              ),
              onTap: () {
                showAnimatedDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return SingleChildScrollView(
                        child: ListBody(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          width: 200.0,
                          child: const FlutterLogo(
                            size: 150.0,
                          ),
                        )
                      ],
                    ));
                  },
                  animationType: DialogTransitionType.size,
                  curve: Curves.linear,
                );
              },
            ),
            const Divider(
              height: 0.5,
            ),
          ],
        ),
      ),
    );
  }
}
