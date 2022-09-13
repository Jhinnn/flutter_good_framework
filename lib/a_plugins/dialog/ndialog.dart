import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';

import '../../z_widget/div_scaffold.dart';

class NDialogDemo extends StatelessWidget {
  const NDialogDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LRScaffold(
      title: 'ndialog',
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: <Widget>[
          OutlinedButton(
            child: const Text("Show CustomDialog from extension"),
            onPressed: () {
              Future.delayed(const Duration(seconds: 3)).showProgressDialog(
                  context,
                  title: const Text("This is just an ordinary loading"),
                  message: const Text(
                      "This is fastest and coolest way to show a dialog"));
            },
          ),
          OutlinedButton(
            child: const Text("NAlertDialog show"),
            onPressed: () {
              const NAlertDialog(
                title: const Text("Test"),
                content: const Text("Iya iya"),
                blur: 2,
              ).show(context, transitionType: DialogTransitionType.Bubble);
            },
          ),
          OutlinedButton(
            child: const Text("NDialog can do it too!"),
            onPressed: () {
              NDialog(
                title: const Text("Test"),
                dialogStyle: DialogStyle(),
                content: const Text("Iya iya"),
              ).show(context);
            },
          ),
          OutlinedButton(
            child: const Text("Progress Dialog"),
            onPressed: () async {
              ProgressDialog progressDialog = ProgressDialog(
                context,
                blur: 0,
                dialogTransitionType: DialogTransitionType.Shrink,
                title: const Text("Title"),
                message: const Text("Message"),
                onDismiss: () {
                  print("Do something onDismiss");
                },
              );
              progressDialog.setLoadingWidget(const CircularProgressIndicator(
                valueColor: const AlwaysStoppedAnimation(Colors.red),
              ));
              progressDialog.setMessage(const Text(
                  "Please Wait, Injecting your phone with my virus"));
              progressDialog.setTitle(const Text("Loading"));
              progressDialog.show();

              await Future.delayed(const Duration(seconds: 5));

              progressDialog.setMessage(const Text("I mean, virus of love :*"));
              progressDialog.setLoadingWidget(Container());
              progressDialog.setTitle(const Text("Just Kidding"));

              await Future.delayed(const Duration(seconds: 5));

              progressDialog.dismiss();
            },
          ),
          OutlinedButton(
            onPressed: () async {
              CustomProgressDialog progressDialog = CustomProgressDialog(
                context,
                blur: 10,
                onDismiss: () {
                  print("Do something onDismiss");
                },
              );
              progressDialog.setLoadingWidget(const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.red),
              ));
              progressDialog.show();

              await Future.delayed(const Duration(seconds: 5));
              progressDialog.setLoadingWidget(Container());

              await Future.delayed(const Duration(seconds: 5));

              progressDialog.dismiss();
            },
            child: const Text("Custom Progress Dialog"),
          ),
          OutlinedButton(
            onPressed: () async {
              print(await ProgressDialog.future(
                context,
                blur: 0.0,
                future: Future.delayed(const Duration(seconds: 5), () {
                  return "HIYAAA";
                }),
                onProgressError: (error) {
                  print("Do something onProgressError");
                },
                onProgressFinish: (data) {
                  print("Do something onProgressFinish");
                },
                onDismiss: () {
                  print("Dismissed");
                },
                message: const Text("Please Wait"),
                cancelText: const Text("Batal"),
                title: const Text("Loging in"),
              ));
            },
            child: const Text("Progress Dialog Future"),
          ),
          OutlinedButton(
            child: const Text("Custom Progress Dialog Future"),
            onPressed: () async {
              print(await CustomProgressDialog.future(
                context,
                backgroundColor: Colors.blue.withOpacity(.5),
                future: Future.delayed(const Duration(seconds: 5), () {
                  return "WOHOOO";
                }),
                onProgressError: (error) {
                  print("Do something onProgressError");
                },
                onProgressFinish: (data) {
                  print("Do something onProgressFinish");
                },
                onDismiss: () {
                  print("Dismissed");
                },
              ));
            },
          ),
          OutlinedButton(
            onPressed: () async {
              NAlertDialog(
                dialogStyle: DialogStyle(titleDivider: true),
                title: const Text("Hi, This is NAlertDialog"),
                content: const Text("And here is your content, hoho... "),
                actions: <Widget>[
                  TextButton(
                    child: const Text("You"),
                    onPressed: () {},
                  ),
                  TextButton(
                    child: const Text("Are"),
                    onPressed: () {},
                  ),
                  TextButton(
                    child: const Text("Awesome"),
                    onPressed: () {},
                  )
                ],
              ).show(context);
            },
            child: const Text("Show NAlertDialog"),
          ),
          OutlinedButton(
            onPressed: () async {
              NDialog(
                dialogStyle: DialogStyle(titleDivider: true),
                title: const Text("Hi, This is NDialog"),
                content: const Text("And here is your content, hoho... "),
                actions: <Widget>[
                  TextButton(
                    child: const Text("You"),
                    onPressed: () {},
                  ),
                  TextButton(
                    child: const Text("Are"),
                    onPressed: () {},
                  ),
                  TextButton(
                    child: const Text("Awesome"),
                    onPressed: () {},
                  )
                ],
              ).show(
                context,
              );
            },
            child: const Text("Show NDialog"),
          ),
          OutlinedButton(
            child: const Text(
              "Show Alert Dialog With Blur Background",
              textAlign: TextAlign.center,
            ),
            onPressed: () async {
              DialogBackground(
                barrierColor: Colors.red.withOpacity(.5),
                blur: 0,
                dialog: AlertDialog(
                  title: const Text("Alert Dialog"),
                  content: const Text(
                      "Wohoo.. This is ordinary AlertDialog with Blur background"),
                  actions: <Widget>[
                    TextButton(
                      child: const Text("You"),
                      onPressed: () {},
                    ),
                    TextButton(
                      child: const Text("Are"),
                      onPressed: () {},
                    ),
                    TextButton(
                      child: const Text("Awesome"),
                      onPressed: () {},
                    )
                  ],
                ),
              ).show(
                context,
              );
            },
          ),
          OutlinedButton(
            child: const Text(
              "Show Alert Dialog With Custom Background Color",
              textAlign: TextAlign.center,
            ),
            onPressed: () async {
              NAlertDialog(
                backgroundColor: Colors.red.withOpacity(.5),
                blur: 0,
                title: const Text("Alert Dialog"),
                content: const Text(
                    "Wohoo.. This is ordinary AlertDialog with Custom Color background"),
                actions: <Widget>[
                  TextButton(
                    child: const Text("You"),
                    onPressed: () {},
                  ),
                  TextButton(
                    child: const Text("Are"),
                    onPressed: () {},
                  ),
                  TextButton(
                    child: const Text("Awesome"),
                    onPressed: () {},
                  )
                ],
              ).show(context);
            },
          ),
          OutlinedButton(
            child: const Text(
              "Dialog Extension",
              textAlign: TextAlign.center,
            ),
            onPressed: () async {
              await AlertDialog(
                title: const Text("Alert Dialog"),
                content: const Text(
                    "Wohoo.. This is ordinary AlertDialog with Blur background"),
                actions: <Widget>[
                  TextButton(
                    child: const Text("You"),
                    onPressed: () {},
                  ),
                  TextButton(
                    child: const Text("Are"),
                    onPressed: () {},
                  ),
                  TextButton(
                    child: const Text("Awesome"),
                    onPressed: () {},
                  )
                ],
              ).show(context);
            },
          ),
          OutlinedButton(
            child: const Text("CupertinoDialog Extension",
                textAlign: TextAlign.center),
            onPressed: () async {
              await CupertinoAlertDialog(
                title: const Text("Alert Dialog"),
                content: const Text(
                    "Wohoo.. This is ordinary AlertDialog with Blur background"),
                actions: <Widget>[
                  TextButton(
                    child: const Text("You"),
                    onPressed: () {},
                  ),
                  TextButton(
                    child: const Text("Are"),
                    onPressed: () {},
                  ),
                  TextButton(
                    child: const Text("Awesome"),
                    onPressed: () {},
                  )
                ],
              ).show(context);
            },
          ),
          OutlinedButton(
            child: const Text("ZoomDIALOG", textAlign: TextAlign.center),
            onPressed: () async {
              await ZoomDialog(
                zoomScale: 5,
                blur: 10,
                child: Container(
                  child: const Text("Zoom me!"),
                  color: Colors.white,
                  padding: const EdgeInsets.all(20),
                ),
              ).show(context);
            },
          ),
        ]
            .map((e) => Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: e,
                ))
            .toList(),
      ),
    );
  }
}
