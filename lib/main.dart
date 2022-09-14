import 'dart:io';
import 'package:flutter/material.dart';
import 'package:good_framework/z_constants/app_fonts.dart';
import 'package:good_framework/z_provider/base_index.dart';
import 'package:logging/logging.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';
import 'z_constants/app_colors.dart';
import 'z_constants/app_route_widget.dart';
import 'z_constants/app_routes.dart';
import 'z_main/home.dart';

final _logger = Logger('main_app');

void main() async {
  Logger.root
    ..level = Level.ALL
    ..onRecord.listen(print);
  Lottie.traceEnabled = true;

  if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
    WidgetsFlutterBinding.ensureInitialized();

    await windowManager.ensureInitialized();

    WindowOptions windowOptions = const WindowOptions(
      size: Size(900, 668),
      center: true,
      backgroundColor: AppColors.themeColor,
      skipTaskbar: false,
      title: 'Flutter Demo',
      titleBarStyle: TitleBarStyle.hidden,
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => IndexProvider()),
      // ChangeNotifierProvider<ExarcisesProvider>(
      //   create: (_) => ExarcisesProvider(),
      // ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        // showPerformanceOverlay: true,
        debugShowCheckedModeBanner: false,
        color: Colors.yellow,
        theme: ThemeData(
          primaryColor: Colors.grey,
          appBarTheme: const AppBarTheme(backgroundColor: AppColors.themeColor),
          textTheme: const TextTheme(
              subtitle1: TextStyle(
                  fontFamily: AppFonts.ngaan,
                  fontSize: 14,
                  color: AppColors.themeColor),
              headline1: TextStyle(
                  fontFamily: AppFonts.ngaan,
                  fontSize: 20,
                  color: Colors.white),
              headline2: TextStyle(
                  fontFamily: AppFonts.ngaan,
                  fontSize: 14,
                  color: Colors.white),
              headline3: TextStyle(
                  fontFamily: AppFonts.ngaan,
                  fontSize: 12,
                  color: Colors.white)),
        ),
        routes: approutes,
        home: const LRHomePage());
  }
}
