import 'dart:io';
import 'package:flutter/material.dart';
import 'package:good_framework/a_plugins/animations/animations/animations.dart';
import 'package:good_framework/a_plugins/animations/lottie/lottie.dart';
import 'package:good_framework/a_plugins/picker/bottom_picker.dart';
import 'package:good_framework/a_plugins/picker/emoji_picker_flutter.dart';
import 'package:good_framework/a_plugins/picker/flutter_colorpicker/flutter_picker.dart';
import 'package:good_framework/a_plugins/picker/flutter_material_pickers/flutter_material_pickers.dart';
import 'package:good_framework/a_plugins/picker/flutter_picker/flutter_picker.dart';
import 'package:good_framework/a_plugins/picker/smart_select/smart_select.dart';
import 'package:good_framework/a_plugins/picker/wechat_asserts_picker/wechat_asserts_picker.dart';
import 'package:good_framework/a_plugins/progress/flutter_animation_progress_bar.dart';
import 'package:good_framework/a_plugins/progress/sn_progress_dialog.dart';
import 'package:good_framework/a_plugins/scrollview/flutter_scroll_to_top/flutter_scroll_to_top.dart';
import 'package:good_framework/a_plugins/scrollview/lazy_load_scrollview.dart';
import 'package:good_framework/a_plugins/scrollview/vertical_scrollable_tabview/vertical_scrollable_tabview.dart';
import 'package:good_framework/z_constants/app_colors.dart';
import 'package:good_framework/z_constants/app_fonts.dart';
import 'package:good_framework/z_provider/base_index.dart';
import 'package:logging/logging.dart';
import 'package:lottie/lottie.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:window_manager/window_manager.dart';
import 'package:provider/provider.dart';
import 'a_plugins/animations/animate_do/animate_do.dart';
import 'a_plugins/animations/animations/container_transition.dart';
import 'a_plugins/animations/animations/fade_scale_transition.dart';
import 'a_plugins/animations/animations/fade_through_transition.dart';
import 'a_plugins/animations/animations/shared_axis_transition.dart';
import 'a_plugins/animations/auto_animated/auto_animated.dart';
import 'a_plugins/animations/simple_animations/simple_animations.dart';

import 'a_plugins/button/animated_button.dart';
import 'a_plugins/button/dropdown_button2/dropdown_button.dart';
import 'a_plugins/button/flutter_reaction_button/ui/flutter_reaction_button.dart';
import 'a_plugins/button/group_button/examples/button_builder_example/example.dart';
import 'a_plugins/button/group_button/examples/common_example/example.dart';
import 'a_plugins/button/group_button/examples/customizable_example/customizable_example.dart';
import 'a_plugins/button/group_button/examples/extended_example/extended_example.dart';
import 'a_plugins/button/group_button/examples/full_options_example/full_options_example.dart';
import 'a_plugins/button/group_button/examples/generics_example/generics_example.dart';
import 'a_plugins/button/group_button/examples/provider_example/ui/group_button_provider_example.dart';
import 'a_plugins/button/group_button/examples/styles_example/example.dart';
import 'a_plugins/button/group_button/group_button.dart';
import 'a_plugins/button/like_button.dart';
import 'a_plugins/button/rounded_loading_button.dart';
import 'a_plugins/button/sign_button.dart';
import 'a_plugins/button/slidable_button.dart';
import 'a_plugins/button/slider_button.dart';
import 'a_plugins/calendar/calendar_timeline/calendar_timeline.dart';
import 'a_plugins/calendar/calendar_view/calendar_view.dart';
import 'a_plugins/calendar/date_picker_timeline/data_picker_timeline.dart';
import 'a_plugins/calendar/flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'a_plugins/calendar/flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'a_plugins/calendar/syncfusion_flutter_calendar/syncfusion_flutter_calendar.dart';
import 'a_plugins/calendar/table_calendar/table_calendar.dart';
import 'a_plugins/dialog/custom_pop_up_menu.dart';
import 'a_plugins/dialog/flutter_animated_dialog/flutter_animated_dialog.dart';
import 'a_plugins/dialog/flutter_smart_dialog.dart';
import 'a_plugins/dialog/modal_bottom_sheet/modal_bottom_sheet.dart';
import 'a_plugins/dialog/ndialog.dart';
import 'a_plugins/dialog/rflutter_alert.dart';
import 'a_plugins/dialog/show_more_text_popup.dart';
import 'a_plugins/drawing/arrow_path/arrow_path.dart';
import 'a_plugins/drawing/dotted_line/dotted_line.dart';
import 'a_plugins/drawing/flutter_painter/flutter_painter.dart';
import 'a_plugins/drawing/hand_signature/hand_signature.dart';
import 'a_plugins/drawing/patterns_canvas/patterns_canvas.dart';
import 'a_plugins/drawing/touchable/touchable.dart';
import 'a_plugins/picker/day_night_time_picker.dart';
import 'a_plugins/picker/filesystem_picker/flie_system_picker.dart';
import 'a_plugins/picker/flex_color_picker/flex_color_picker.dart';
import 'a_plugins/picker/progressive_time_picker/progressive_time_picker.dart';
import 'a_plugins/progress/cupertino_stepper.dart';
import 'a_plugins/progress/liquid_progress_indicator/liquid_progress_indicator.dart';
import 'a_plugins/progress/modal_progress_hud_nsn.dart';
import 'a_plugins/progress/percent_indicator.dart';
import 'a_plugins/progress/sleek_circular_slider/ui/sleek_circular_slider_demo.dart';
import 'a_plugins/scrollview/extended_nested_scroll_view.dart';
import 'a_plugins/scrollview/fading_edge_scrollview/fading_edge_scrollview.dart';
import 'a_plugins/scrollview/intro_slider/intro_slider_demo.dart';
import 'a_plugins/segment/animated_segment.dart';
import 'a_plugins/segment/animated_segmented_tab_control.dart';
import 'a_plugins/segment/flutter_advanced_segment.dart';
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
        routes: <String, WidgetBuilder>{
// animations
          Routes.lottie: (_) => const LottieDemo(),
          Routes.animations: (_) => const AnimationsDemo(),
          //animations  animations
          Routes.openContainer: (_) => const OpenContainerTransformDemo(),
          Routes.sharedAxisTransition: (_) => const SharedAxisTransitionDemo(),
          Routes.fadeThroughTransition: (_) =>
              const FadeThroughTransitionDemo(),
          Routes.fadeScaleTransition: (_) => const FadeScaleTransitionDemo(),

// button
          Routes.groupButtonExtendedExample: (_) =>
              GroupButtonExtendedExample(),
          Routes.groupButtonProviderExample: (_) =>
              const GroupButtonProviderExample(),
          Routes.stylesExample: (_) => const StylesExample(),
          Routes.customizableExample: (_) => CustomizableExample(),
          Routes.buttonBuilderExample: (_) => ButtonBuilderExample(),
          Routes.fullOptionsSelectedExample: (_) =>
              const FullOptionsSelectedExample(),
          Routes.genericsExample: (_) => GenericsExample(),
          Routes.commonExample: (_) => CommonExample(),

          Routes.animateDo: (_) => const AnimateDo(),
          Routes.simpleAnimations: (_) => const SimpleAnimations(),
          Routes.autoAnimated: (_) => const AutoAnimated(),
          Routes.signButton: (_) => const SignButton(),
          Routes.groupButton: (_) => const GroupButtonDemo(),
          Routes.dropdownButton2: (_) => const DropDownButton(),
          Routes.likeButton: (_) => const LikeButtonDemo(),
          Routes.sliderButton: (_) => const SliderButtonDemo(),
          Routes.roundedLoadingButton: (_) => const RoundedLoadingButtonDemo(),
          Routes.flutterReactionButton: (_) => const ReactionButtonButton(),
          Routes.animatedButton: (_) => const AnimatedButtonDemo(),
          Routes.slidableButton: (_) => const SlidableButtonDemo(),

          // Calendar
          Routes.tableCalendar: (_) => const TableCalendarDemo(),
          Routes.calendarTimeline: (_) => const CalendarTimelineDemo(),
          Routes.datePickerTimeline: (_) => const DatePickerTimelineDemo(),
          Routes.flutterNeatAndCleanCalendar: (_) =>
              const FlutterNeatCleanCalendar(),
          Routes.syncfusionFlutterCalendar: (_) =>
              const SyncfusionFlutterCalendarDemo(),
          Routes.flutterCalendarCarousel: (_) => const CalendarCarouselDemo(),
          Routes.calendarView: (_) => const CalendarViewDemo(),

          ///drawing
          Routes.arrowPath: (_) => const ArrowPathDemo(),
          Routes.dottedLine: (_) => const DottedLineDemo(),
          Routes.flutterPainter: (_) => const FlutterPainterExample(),
          Routes.handSignature: (_) => HandSignatureDemo(),
          Routes.patternsCanvas: (_) => const PatternsCanvasDemo(),
          Routes.touchable: (_) => const TouchableDemo(),
          //dialog
          Routes.ndialog: (_) => const NDialogDemo(),
          Routes.modalBottomSheet: (_) => const ModalBottomSheetDemo(),
          Routes.rflutterAlert: (_) => const RFlutterDemo(),
          Routes.customPopUpMenu: (_) => const CustomPopUpMenuDemo(),
          Routes.showMoreTextPopup: (_) => const ShowMoreTextPopupDemo(),
          Routes.flutterSmartDialog: (_) => FlutterSmartDialogDemo(),
          Routes.flutterAnimatedDialog: (_) => const FLutterAnimatedDemo(),

          //picker
          Routes.flieSystemPicker: (_) => const FlieSystemPickerDemo(),
          Routes.flexColorPicker: (_) => const FlexColorPicker(),
          Routes.flutterColorpicker: (_) => const FlutterPickerColorDemo(),
          Routes.smartSelect: (_) => const SmartSelectDemo(),
          Routes.emojiPickerFlutter: (_) => const EmojiPickerFlutterDemo(),
          Routes.daynightTimepicker: (_) => const DayNightTimePickerDemo(),
          Routes.flutterMaterialPickers: (_) => const FlutterMaterialPickers(),
          Routes.wechatAssetsPicker: (_) => const WechatAssertsPickerDemo(),
          Routes.bottomPicker: (_) => const BottomPickerDemo(),
          Routes.flutterPicker: (_) => const FlutterPickerDemo(),
          Routes.progressiveTimePicker: (_) => const ProgressiveTimePicker(),
          Routes.flutterDatetimePicker: (_) => const DatePickerTimelineDemo(),

          //progress
          Routes.percentIndicator: (_) => const ProgressIndicatorDemo(),
          Routes.snProgressDialog: (_) => const SnProgressDialogDemo(),
          Routes.cupertinoStepper: (_) => const CupertinoStepperDemo(),
          Routes.liquidProgressIndicator: (_) =>
              const LiquidProgressIndicatorDemo(),
          Routes.modalProgressHudNsn: (_) => const ModelProgressHudNsnDemo(),
          Routes.sleekCircularSlider: (_) => SleekCircularSliderDemo(
                viewModel: ExampleViewModel(
                    appearance: const CircularSliderAppearance(),
                    pageColors: [Colors.white, Colors.black],
                    max: 100,
                    min: 20,
                    value: 50),
              ),
          Routes.flutterAnimationProgressBar: (_) =>
              const FLutterAnimationProgressBarDemo(),
          //scrollview
          Routes.introSlider: (_) => const IntroSliderDemo(),
          Routes.lazyLoadScrollview: (_) => const LazyLaodScrollViewDemo(),
          Routes.verticalScrollableTabview: (_) =>
              const VerticalScrollableTabviewDemo(),
          Routes.fadingEdgeScrollview: (_) => const FadingEdgeScrollViewDemo(),
          Routes.flutterScrollToTop: (_) => const FlutterScrollToTopDemo(),
          Routes.extendedNestedScrollView: (_) =>
              const ExtendedNestedScrollViewDemo(),

          //scrollview
          Routes.animatedSegment: (_) => const AnimatedSegmentDemo(),
          Routes.flutterAdvancedSegment: (_) =>
              const FlutterAdvancedSegmentDemo(),
          Routes.animatedSegmentedTabControl: (_) =>
              const AnimatedSegmentedTabControllerDemo(),
         
        },
        home: const LRHomePage());
  }
}
