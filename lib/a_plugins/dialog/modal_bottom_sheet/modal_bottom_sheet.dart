import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../z_widget/div_scaffold.dart';
import 'modals/circular_modal.dart';
import 'modals/floating_modal.dart';
import 'modals/modal_complex_all.dart';
import 'modals/modal_fit.dart';
import 'modals/modal_inside_modal.dart';
import 'modals/modal_will_scope.dart';
import 'modals/modal_with_navigator.dart';
import 'modals/modal_with_nested_scroll.dart';
import 'modals/modal_with_scroll.dart';
import 'modals/modal_with_page_view.dart';

import 'examples/cupertino_share.dart';
import 'web_frame.dart';

class ModalBottomSheetDemo extends StatefulWidget {
  const ModalBottomSheetDemo({
    Key? key,
  }) : super(key: key);

  

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ModalBottomSheetDemo> {
  @override
  Widget build(BuildContext context) {
    return LRScaffold(
      title: 'modal_bottom_sheet',
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          transitionBetweenRoutes: false,
          middle: const Text('iOS13 Modal Presentation'),
          trailing: GestureDetector(
            child: const Icon(Icons.arrow_forward),
            onTap: () => Navigator.of(context).pushNamed('ss'),
          ),
        ),
        child: SizedBox.expand(
          child: SingleChildScrollView(
            primary: true,
            child: SafeArea(
              bottom: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                      title: const Text('Cupertino Photo Share Example'),
                      onTap: () => Navigator.of(context).push(
                          MaterialWithModalsPageRoute(
                              builder: (context) => CupertinoSharePage()))),
                  section('STYLES'),
                  ListTile(
                    title: const Text('Material fit'),
                    onTap: () => showMaterialModalBottomSheet(
                      expand: false,
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (context) => const ModalFit(),
                    ),
                  ),
                  ListTile(
                    title: const Text('Bar Modal'),
                    onTap: () => showBarModalBottomSheet(
                      expand: true,
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (context) => const ModalInsideModal(),
                    ),
                  ),
                  ListTile(
                    title: const Text('Avatar Modal'),
                    onTap: () => showAvatarModalBottomSheet(
                      expand: true,
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (context) => const ModalInsideModal(),
                    ),
                  ),
                  ListTile(
                    title: const Text('Float Modal'),
                    onTap: () => showFloatingModalBottomSheet(
                      context: context,
                      builder: (context) => const ModalFit(),
                    ),
                  ),
                  ListTile(
                    title: const Text('Cupertino Modal fit'),
                    onTap: () => showCupertinoModalBottomSheet(
                      expand: false,
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (context) => const ModalFit(),
                    ),
                  ),
                  section('COMPLEX CASES'),
                  ListTile(
                      title:
                          const Text('Cupertino Small Modal forced to expand'),
                      onTap: () => showCupertinoModalBottomSheet(
                            expand: true,
                            context: context,
                            backgroundColor: Colors.transparent,
                            builder: (context) => const ModalFit(),
                          )),
                  ListTile(
                    title: const Text('Reverse list'),
                    onTap: () => showBarModalBottomSheet(
                      expand: true,
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (context) =>
                          const ModalInsideModal(reverse: true),
                    ),
                  ),
                  ListTile(
                    title: const Text('Cupertino Modal inside modal'),
                    onTap: () => showCupertinoModalBottomSheet(
                      expand: true,
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (context) => const ModalInsideModal(),
                    ),
                  ),
                  ListTile(
                      title:
                          const Text('Cupertino Modal with inside navigation'),
                      onTap: () => showCupertinoModalBottomSheet(
                            expand: true,
                            context: context,
                            backgroundColor: Colors.transparent,
                            builder: (context) => const ModalWithNavigator(),
                          )),
                  ListTile(
                    title: const Text(
                        'Cupertino Navigator + Scroll + WillPopScope'),
                    onTap: () => showCupertinoModalBottomSheet(
                      expand: true,
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (context) => const ComplexModal(),
                    ),
                  ),
                  ListTile(
                    title: const Text('Modal with WillPopScope'),
                    onTap: () => showCupertinoModalBottomSheet(
                      expand: true,
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (context) => const ModalWillScope(),
                    ),
                  ),
                  ListTile(
                    title: const Text('Modal with Nested Scroll'),
                    onTap: () => showCupertinoModalBottomSheet(
                      expand: true,
                      context: context,
                      builder: (context) => const NestedScrollModal(),
                    ),
                  ),
                  ListTile(
                    title: const Text('Modal with PageView'),
                    onTap: () => showBarModalBottomSheet(
                      expand: true,
                      context: context,
                      builder: (context) => const ModalWithPageView(),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget section(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.caption,
      ),
    );
  }
}
