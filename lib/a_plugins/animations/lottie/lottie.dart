import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:lottie/lottie.dart';
import '../../../z_utils/show_dialog.dart';
import '../../../z_widget/div_scaffold.dart';
import '../../../z_widget/example_item.dart';
import 'src/all_files.g.dart';

final _logger = Logger('main_app');

class LottieDemo extends StatelessWidget {
  const LottieDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LRScaffold(
        title: 'Lottie',
        child: Scrollbar(
          child: GridView.builder(
            itemCount: files.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4),
            itemBuilder: (context, index) {
              var assetName = files[index];
              return ExampleItem(
                voidCallback: () =>
                    LRUtil.showCommonDialog(context, Detail(assetName)),
                child: Lottie.asset(
                  assetName,
                  onWarning: (w) => _logger.info('$assetName - $w'),
                  frameBuilder: (context, child, composition) {
                    return AnimatedOpacity(
                      opacity: composition == null ? 0 : 1,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeOut,
                      child: child,
                    );
                  },
                ),
              );
            },
          ),
        ));
  }
}

class Detail extends StatefulWidget {
  final String assetName;

  const Detail(this.assetName, {Key? key}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> with TickerProviderStateMixin {
  late final _controller = AnimationController(vsync: this);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: Lottie.asset(
              widget.assetName,
              controller: _controller,
              onLoaded: (composition) {
                _controller.duration = composition.duration;
                _controller.repeat();
              },
            ),
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, _) => Row(
              children: <Widget>[
                Expanded(
                  child: Slider(
                    value: _controller.value,
                    onChanged: (newValue) {
                      _controller.value = newValue;
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(
                      _controller.isAnimating ? Icons.stop : Icons.play_arrow),
                  onPressed: () {
                    setState(() {
                      if (_controller.isAnimating) {
                        _controller.stop();
                      } else {
                        _controller.repeat();
                      }
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
