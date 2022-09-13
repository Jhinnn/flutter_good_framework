import 'dart:io';

import 'package:flutter/material.dart';
import 'package:good_framework/a_plugins/animations/animations/animations.dart';
import 'package:good_framework/a_plugins/animations/auto_animated/auto_animated.dart';
import 'package:good_framework/a_plugins/animations/lottie/lottie.dart';
import 'package:good_framework/z_constants/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../z_constants/app_strings.dart';
import '../z_constants/app_text_styles.dart';
import '../z_model/plugins_model.dart';
import '../z_provider/base_index.dart';

class Plugins extends StatefulWidget {
  const Plugins({Key? key}) : super(key: key);

  @override
  State<Plugins> createState() => _PluginsState();
}

class _PluginsState extends State<Plugins> {
  @override
  Widget build(BuildContext context) {
    int pluginIndex = context
        .select((IndexProvider indexProvider) => indexProvider.pluginIndex);

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          // Container(
          //   color: AppColors.themeColor,
          //   height: 40,
          // ),
          
          Wrap(
            children: AppStrings.pluginsWidgets
                .map((e) => Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                            color: AppStrings.pluginsWidgets.indexOf(e) ==
                                    pluginIndex
                                ? AppColors.themeColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(4)),
                        child: InkWell(
                          onTap: () => context
                              .read<IndexProvider>()
                              .setPluginIndex(
                                  AppStrings.pluginsWidgets.indexOf(e)),
                          child: Text(e,
                              style: AppStrings.pluginsWidgets.indexOf(e) ==
                                          pluginIndex
                                      ? Theme.of(context).textTheme.headline2
                                      : Theme.of(context).textTheme.bodyText1,
                            )
                        ),
                      ),
                    ))
                .toList(),
          ),
          Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio:
                          (Platform.isWindows || Platform.isMacOS) ? 3 : 1),
                  itemCount: AppStrings.pluginsTypeList[pluginIndex].length,
                  itemBuilder: (BuildContext context, int index) {
                    List<PluginsModel> plugins =
                        AppStrings.pluginsTypeList[pluginIndex];

                    PluginsModel pluginsModel = plugins[index];
                    return InkWell(
                      onTap: () => Navigator.pushNamed(
                          context, '/${pluginsModel.pluginName}'),
                      child: Card(
                        color: AppColors.themeColor,
                        elevation: 5,
                        child: Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              pluginsModel.pluginName,
                              style: AppTextStyles.pluginTitleStyle,
                            ),
                            Text(
                              pluginsModel.pluginVersion,
                              style: AppTextStyles.pluginTitleStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 14,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  pluginsModel.likes.toString(),
                                  style: AppTextStyles.pluginTitleStyle,
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () => _openPluginAddress(
                                  pluginsModel.pluginPubAddress),
                              child: Text(
                                pluginsModel.pluginPubAddress,
                                style: AppTextStyles.pluginSubTitleStyle,
                              ),
                            ),
                            // Text(
                            //   pluginsModel.pluginGitHubAddress,
                            //   style: AppTextStyles.pluginSubTitleStyle,
                            // ),
                          ],
                        )),
                      ),
                    );
                  }))
        ],
      ),
    );
  }

  _openPluginAddress(String pluginPubAddress) async {
    if (await canLaunchUrlString(pluginPubAddress)) {
      await launchUrl(Uri.parse(pluginPubAddress),
          mode: LaunchMode.externalApplication);
    }
  }

  // _openPluginDetailPage(PluginsModel pluginsModel) {
  //   switch (pluginsModel.pluginName) {
  //     case 'animate_do':
  //       LRUtil.showCommonDialog(
  //           context,
  //           AnimateDo(
  //             pluginsModel: pluginsModel,
  //           ));
  //       break;

  //     case 'lottie':
  //       break;
  //     case 'simple_animations':
  //       LRUtil.showCommonDialog(
  //           context,
  //           SimpleAnimations(
  //             pluginsModel: pluginsModel,
  //           ));
  //       break;

  //     case 'auto_animated':
  //       LRUtil.showCommonDialog(
  //           context,
  //           AutoAnimated(
  //             pluginsModel: pluginsModel,
  //           ));
  //       break;
  //     case 'animations':
  //       LRUtil.showCommonDialog(
  //           context,
  //           Animations(
  //             pluginsModel: pluginsModel,
  //           ));
  //       break;
  //     case 'sign_button':
  //       LRUtil.showCommonDialog(
  //           context,
  //           SignButton(
  //             pluginsModel: pluginsModel,
  //           ));
  //       break;
  //     case 'group_button':
  //       LRUtil.showCommonDialog(context, const GroupButtonDemo());
  //       break;
  //     case 'dropdown_button2':
  //       LRUtil.showCommonDialog(
  //           context,
  //           DropDownButton(
  //             pluginsModel: pluginsModel,
  //           ));
  //       break;
  //     case 'like_button':
  //       LRUtil.showCommonDialog(context, LikeButtonDemo());
  //       break;
  //     case 'slider_button':
  //       LRUtil.showCommonDialog(context, const SliderButtonDemo());
  //       break;
  //     case 'rounded_loading_button':
  //       LRUtil.showCommonDialog(context, const RoundedLoadingButtonDemo());
  //       break;
  //     case 'flutter_reaction_button':
  //       LRUtil.showCommonDialog(context, const ReactionButtonButton());
  //       break;
  //     case 'animated_button':
  //       LRUtil.showCommonDialog(context, AnimatedButtonDemo());
  //       break;
  //     case 'slidable_button':
  //       LRUtil.showCommonDialog(context, const SlidableButtonDemo());
  //       break;

  //     case 'table_calendar':
  //       LRUtil.showCommonDialog(context, TableCalendarDemo());
  //       break;
  //     case 'calendar_timeline':
  //       LRUtil.showCommonDialog(context, const CalendarTimelineDemo());
  //       break;
  //     case 'date_picker_timeline':
  //       LRUtil.showCommonDialog(context, DatePickerTimelineDemo());
  //       break;

  //     case 'flutter_neat_and_clean_calendar':
  //       LRUtil.showCommonDialog(context, CalendarScreen());
  //       break;
  //     case 'syncfusion_flutter_calendar':
  //       LRUtil.showCommonDialog(context, SyncfusionFlutterCalendarDemo());
  //       break;
  //     case 'flutter_calendar_carousel':
  //       LRUtil.showCommonDialog(context, const CalendarCarouselDemo());
  //       break;

  //     case 'dotted_line':
  //       LRUtil.showCommonDialog(context, const DottedLineDemo());
  //       break;
  //     case 'patterns_canvas':
  //       LRUtil.showCommonDialog(context, const PatternsCanvasDemo());
  //       break;
  //     case 'hand_signature':
  //       LRUtil.showCommonDialog(context, HandSignatureDemo());
  //       break;
  //     case 'flutter_painter':
  //       LRUtil.showCommonDialog(context, const FlutterPainterExample());
  //       break;
  //     // case 'touchable':  有错误
  //     //   LRUtil.showCommonDialog(context, const TouchableDemo());
  //     //   break;

  //     case 'flutter_colorpicker':
  //       LRUtil.showCommonDialog(context, const FlutterPickerColorDemo());
  //       break;
  //     case 'smart_select':
  //       LRUtil.showCommonDialog(context, SmartSelectDemo());
  //       break;
  //     case 'emoji_picker_flutter':
  //       LRUtil.showCommonDialog(context, const EmojiPickerFlutterDemo());
  //       break;

  //     case 'day_night_time_picker':
  //       LRUtil.showCommonDialog(context, const DayNightTimePickerDemo());
  //       break;

  //     case 'flex_color_picker':
  //       LRUtil.showCommonDialog(context, const FlexColorPicker());
  //       break;
  //     case 'flutter_material_pickers':
  //       LRUtil.showCommonDialog(context, const FlutterMaterialPickers());
  //       break;

  //     case 'filesystem_picker':
  //       LRUtil.showCommonDialog(context, const FlieSystemPickerDemo());
  //       break;

  //     case 'bottom_picker':
  //       LRUtil.showCommonDialog(context, BottomPickerDemo());
  //       break;
  //     case 'progressive_time_picker':
  //       LRUtil.showCommonDialog(context, ProgressiveTimePickerDemo());
  //       break;
  //     case 'flutter_picker':
  //       LRUtil.showCommonDialog(context, FlutterPickerDemo());
  //       break;
  //     case 'flutter_datetime_picker':
  //       LRUtil.showCommonDialog(context, const FlutterDateTimePickerDemo());
  //       break;

  //     case 'custom_pop_up_menu':
  //       LRUtil.showCommonDialog(context, const CustomPopUpMenuDemo());
  //       break;

  //     case 'ndialog':
  //       LRUtil.showCommonDialog(context, NDialogDemo());
  //       break;

  //     case 'modal_bottom_sheet':
  //       LRUtil.showCommonDialog(context, ModalBottomSheetDemo());
  //       break;

  //     case 'rflutter_alert':
  //       LRUtil.showCommonDialog(context, RFlutterDemo());
  //       break;

  //     case 'show_more_text_popup':
  //       LRUtil.showCommonDialog(context, ShowMoreTextPopupDemo());
  //       break;
  //     case 'simple_fontellico_progress_dialog':
  //       LRUtil.showCommonDialog(
  //           context, const SimpleFontellicoProgressDialog());
  //       break;

  //     case 'flutter_smart_dialog':
  //       LRUtil.showCommonDialog(context, FlutterSmartDialogDemo());
  //       break;
  //     case 'flutter_speed_dial':
  //       LRUtil.showCommonDialog(context, const FlutterSpeedDialDemo());
  //       break;
  //     case 'flutter_animated_dialog':
  //       LRUtil.showCommonDialog(context, const FLutterAnimatedDemo());
  //       break;
  //     case 'adaptive_dialog':
  //       LRUtil.showCommonDialog(context, const AdaptiveDiaologDemo());
  //       break;

  //     case 'percent_indicator':
  //       LRUtil.showCommonDialog(context, const ProgressIndicatorDemo());
  //       break;
  //     case 'sn_progress_dialog':
  //       LRUtil.showCommonDialog(context, SnProgressDialogDemo());
  //       break;
  //     case 'cupertino_stepper':
  //       LRUtil.showCommonDialog(context, StepperAppDemo());
  //       break;
  //     case 'liquid_progress_indicator':
  //       LRUtil.showCommonDialog(context, LiquidProgressIndicatorDemo());
  //       break;
  //     case 'sleek_circular_slider':
  //       LRUtil.showCommonDialog(context, SleekCircularSilderDemo());
  //       break;
  //     case 'flutter_animation_progress_bar':
  //       LRUtil.showCommonDialog(context, FLutterAnimationProgressBarDemo());
  //       break;

  //     case 'modal_progress_hud_nsn':
  //       LRUtil.showCommonDialog(
  //           context,
  //           ModelProgressHudNsnDemo(
  //             onSignIn: () {},
  //           ));
  //       break;

  //     case 'lazy_load_scrollview':
  //       LRUtil.showCommonDialog(
  //           context,
  //           LazyLaodScrollViewDemo(
  //             title: 'LazyLaodScrollViewDemo',
  //           ));
  //       break;

  //     case 'vertical_scrollable_tabview':
  //       LRUtil.showCommonDialog(
  //           context,
  //           VerticalScrollableTabviewDemo(
  //             title: 'VerticalScrollableTabviewDemo',
  //           ));
  //       break;

  //     case 'fading_edge_scrollview':
  //       LRUtil.showCommonDialog(context, FadingEdgeScrollViewDemo());
  //       break;
  //     case 'flutter_scroll_to_top':
  //       LRUtil.showCommonDialog(context, FlutterScrollToTopDemo());
  //       break;

  //     case 'extended_nested_scroll_view':
  //       LRUtil.showCommonDialog(context, const ExtendedNestedScrollViewDemo());
  //       break;

  //     case 'flutter_advanced_segment':
  //       LRUtil.showCommonDialog(context, const FlutterAdvancedSegmentDemo());
  //       break;

  //     case 'flutter_segment':
  //       LRUtil.showCommonDialog(context, FlutterSegmentDemo());
  //       break;
  //     case 'animated_segment':
  //       LRUtil.showCommonDialog(context, const AnimatedSegmentDemo());
  //       break;
  //     case 'animated_segmented_tab_control':
  //       LRUtil.showCommonDialog(
  //           context, const AnimatedSegmentedTabControllerDemo());
  //       break;

  //     case 'intro_slider':
  //       LRUtil.showCommonDialog(context, const IntroSliderDemo());
  //       break;

  //     case 'flutter_onboarding_slider':
  //       LRUtil.showCommonDialog(
  //           context, const AnimatedSegmentedTabControllerDemo());
  //       break;

  //     case 'flutter_slider_drawer':
  //       LRUtil.showCommonDialog(context, FlutterSliderDrawerDemo());
  //       break;

  //     case 'slide_to_confirm':
  //       LRUtil.showCommonDialog(context, SilderToConfirmDemo());
  //       break;

  //     case 'another_xlider':
  //       LRUtil.showCommonDialog(context, AnotherSliderDemo());
  //       break;

  //     case 'vertical_weight_slider':
  //       LRUtil.showCommonDialog(context, const VerticalWeightSliderDemo());
  //       break;

  //     case 'animated_theme_switcher':
  //       LRUtil.showCommonDialog(context, const AnimatedThemeSwitcherDemo());
  //       break;

  //     case 'list_tile_switch':
  //       LRUtil.showCommonDialog(context, ListTiteSwitchDemo());
  //       break;

  //     case 'flutter_advanced_switch':
  //       LRUtil.showCommonDialog(context, FlutterAdvancedSwitchDemo());
  //       break;

  //     case 'animated_toggle_switch':
  //       LRUtil.showCommonDialog(context, FlutterToggleSwitchDemo());
  //       break;

  //     case 'toggle_switch':
  //       LRUtil.showCommonDialog(context, ToggleSwitchDemo());
  //       break;

  //     case 'flutter_switch':
  //       LRUtil.showCommonDialog(context, FlutterSwitchDemo());
  //       break;

  //     case 'accordion':
  //       LRUtil.showCommonDialog(context, AccordionAppDemo());
  //       break;
  //     case 'azlistview':
  //       LRUtil.showCommonDialog(context, AListViewDemo());
  //       break;

  //     case 'custom_refresh_indicator':
  //       LRUtil.showCommonDialog(context, CustomRefreshIndicatorDemo());
  //       break;

  //     case 'data_tables':
  //       LRUtil.showCommonDialog(context, DataTablesDemo());
  //       break;

  //     case 'data_tables2':
  //       LRUtil.showCommonDialog(context, DataTable2Demo());
  //       break;

  //     case 'draggable_scrollbar':
  //       LRUtil.showCommonDialog(
  //           context,
  //           DraggableScrollBarDemo(
  //             title: 'DraggableScrollBarDemo',
  //           ));
  //       break;

  //     case 'filter_list':
  //       LRUtil.showCommonDialog(
  //           context,
  //           FillterListDemo(
  //             title: 'DraggableScrollBarDemo',
  //           ));
  //       break;

  //     case 'flutter_layout_grid':
  //       LRUtil.showCommonDialog(context, FlutterLayoutGirdDemo());
  //       break;

  //     case 'flutter_staggered_animations':
  //       LRUtil.showCommonDialog(context, FlutterStaggeredAnimationsDemo());
  //       break;

  //     case 'flutter_wall_layout':
  //       LRUtil.showCommonDialog(context, FlutterWallLayoutDemo());
  //       break;

  //     case 'group_list_view':
  //       LRUtil.showCommonDialog(context, GroupListViewDemo());
  //       break;

  //     case 'grouped_list':
  //       LRUtil.showCommonDialog(context, GroupedListDemo());
  //       break;

  //     case 'indexed_list_view':
  //       LRUtil.showCommonDialog(context, IndexedListViewDemo());
  //       break;

  //     case 'infinite_scroll_pagination':
  //       LRUtil.showCommonDialog(context, InfiniteScrollPaginationDemo());
  //       break;

  //     case 'inview_notifier_list':
  //       LRUtil.showCommonDialog(context, InviewNotifierDemo());
  //       break;

  //     case 'responsive_table':
  //       LRUtil.showCommonDialog(context, ResponsiveTableDemo());
  //       break;

  //     case 'scrollable_positioned_list':
  //       LRUtil.showCommonDialog(context, ScrollablePositionedListExample());
  //       break;

  //     case 'searchable_listview':
  //       LRUtil.showCommonDialog(context, SearchableListviewDemo());
  //       break;

  //     case 'sticky_grouped_list':
  //       LRUtil.showCommonDialog(context, StickyGroupedListDemo());
  //       break;
  //     default:
  //   }
  // }
}
