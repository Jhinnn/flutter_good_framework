import 'package:flutter/material.dart';

class IndexProvider extends ChangeNotifier {
  ///控制左边主菜单切换
  int _mainIndex = 0;
  get mainIndex => _mainIndex;
  setMainIndex(int mainIndex) {
    _mainIndex = mainIndex;
    notifyListeners();
  }

  ///控制基本组件按钮切换
  int _baseIndex = 0;
  get baseIndex => _baseIndex;
  setBaseIndex(int baseIndex) {
    _baseIndex = baseIndex;
    notifyListeners();
  }

  ///控制布局组件按钮切换
  int _layoutIndex = 0;
  get layoutIndex => _layoutIndex;
  setLayoutIndex(int layoutIndex) {
    _layoutIndex = layoutIndex;
    notifyListeners();
  }


  int _pluginIndex = 0;
  get pluginIndex => _pluginIndex;
  setPluginIndex(int pluginIndex) {
    _pluginIndex = pluginIndex;
    notifyListeners();
  }
}
