import 'package:flutter/material.dart';
import 'package:vertical_scrollable_tabview/vertical_scrollable_tabview.dart';

import '../../../z_widget/div_scaffold.dart';
import 'category_section.dart';
import 'example_data.dart';

class VerticalScrollableTabviewDemo extends StatefulWidget {
  const VerticalScrollableTabviewDemo({
    Key? key,
  }) : super(key: key);

  @override
  _VerticalScrollableTabviewDemoState createState() =>
      _VerticalScrollableTabviewDemoState();
}

class _VerticalScrollableTabviewDemoState
    extends State<VerticalScrollableTabviewDemo>
    with SingleTickerProviderStateMixin {
  final List<Category> data = ExampleData.data;

  // TabController More Information => https://api.flutter.dev/flutter/material/TabController-class.html
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: data.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LRScaffold(
      title: 'vertical_scrollable_tabview',
      child: VerticalScrollableTabView(
        tabController: tabController,
        listItemData: data,
        verticalScrollPosition: VerticalScrollPosition.begin,
        eachItemChild: (object, index) =>
            CategorySection(category: object as Category),
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text("SliverAppBar"),
              titlePadding: EdgeInsets.only(bottom: 50),
              collapseMode: CollapseMode.pin,
              background: FlutterLogo(),
            ),
            bottom: TabBar(
              isScrollable: true,
              controller: tabController,
              indicatorPadding: const EdgeInsets.symmetric(horizontal: 16.0),
              indicatorColor: Colors.cyan,
              labelColor: Colors.cyan,
              unselectedLabelColor: Colors.white,
              indicatorWeight: 3.0,
              tabs: data.map((e) {
                return Tab(text: e.title);
              }).toList(),
              onTap: (index) {
                VerticalScrollableTabBarStatus.setIndex(index);
              },
            ),
          ),
        ],
      ),
    );
  }
}
