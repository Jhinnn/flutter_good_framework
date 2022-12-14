import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../../z_widget/div_scaffold.dart';

class LazyLaodScrollViewDemo extends StatefulWidget {
  const LazyLaodScrollViewDemo({Key? key}) : super(key: key);

  @override
  _LazyLaodScrollViewDemoState createState() =>
      new _LazyLaodScrollViewDemoState();
}

class _LazyLaodScrollViewDemoState extends State<LazyLaodScrollViewDemo> {
  List<int> verticalData = [];
  List<int> horizontalData = [];

  final int increment = 10;

  bool isLoadingVertical = false;
  bool isLoadingHorizontal = false;

  @override
  void initState() {
    _loadMoreVertical();
    _loadMoreHorizontal();
    super.initState();
  }

  Future _loadMoreVertical() async {
    setState(() {
      isLoadingVertical = true;
    });

    // Add in an artificial delay
    await new Future.delayed(const Duration(seconds: 2));

    verticalData.addAll(
        List.generate(increment, (index) => verticalData.length + index));

    setState(() {
      isLoadingVertical = false;
    });
  }

  Future _loadMoreHorizontal() async {
    setState(() {
      isLoadingHorizontal = true;
    });

    // Add in an artificial delay
    await new Future.delayed(const Duration(seconds: 2));

    horizontalData.addAll(
        List.generate(increment, (index) => horizontalData.length + index));

    setState(() {
      isLoadingHorizontal = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LRScaffold(
      title: 'lazy_load_scrollview',
      child: LazyLoadScrollView(
        isLoading: isLoadingVertical,
        onEndOfPage: () => _loadMoreVertical(),
        child: Scrollbar(
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Nested horizontal ListView',
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                  height: 180,
                  child: LazyLoadScrollView(
                      isLoading: isLoadingHorizontal,
                      scrollDirection: Axis.horizontal,
                      onEndOfPage: () => _loadMoreHorizontal(),
                      child: Scrollbar(
                          child: ListView.builder(
                              itemCount: horizontalData.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, position) {
                                return DemoItem(position);
                              })))),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Vertical ListView',
                  textAlign: TextAlign.center,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: verticalData.length,
                itemBuilder: (context, position) {
                  return DemoItem(position);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DemoItem extends StatelessWidget {
  final int position;

  const DemoItem(
    this.position, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    color: Colors.grey,
                    height: 40.0,
                    width: 40.0,
                  ),
                  const SizedBox(width: 8.0),
                  Text("Item $position"),
                ],
              ),
              const Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sed vulputate orci. Proin id scelerisque velit. Fusce at ligula ligula. Donec fringilla sapien odio, et faucibus tortor finibus sed. Aenean rutrum ipsum in sagittis auctor. Pellentesque mattis luctus consequat. Sed eget sapien ut nibh rhoncus cursus. Donec eget nisl aliquam, ornare sapien sit amet, lacinia quam."),
            ],
          ),
        ),
      ),
    );
  }
}
