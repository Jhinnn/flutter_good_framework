import 'package:flutter/material.dart';
import 'package:auto_animated/auto_animated.dart';
import 'package:good_framework/z_widget/div_scaffold.dart';
import '../../../z_constants/constants.dart';
import '../../../z_model/plugins_model.dart';

class AutoAnimated extends StatefulWidget {
  
  const AutoAnimated({Key? key,}) : super(key: key);

  @override
  State<AutoAnimated> createState() => AutoAnimatedState();
}

class AutoAnimatedState extends State<AutoAnimated> {
  @override
  Widget build(BuildContext context) {
    return LRScaffold(
      title: 'AutoAnimated',
      child: SingleChildScrollView(
        child: Column(
          children: [
            
            SizedBox(
              height: 500,
              child: LiveList(
                showItemInterval: const Duration(milliseconds: 500),
                showItemDuration: const Duration(seconds: 1),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
                scrollDirection: Axis.vertical,
                itemCount: 10,
                itemBuilder: _buildAnimatedItem,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedItem(
    BuildContext context,
    int index,
    Animation<double> animation,
  ) =>
      FadeTransition(
        opacity: Tween<double>(
          begin: 0,
          end: 1,
        ).animate(animation),
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -0.1),
            end: Offset.zero,
          ).animate(animation),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _buildCard(index.toString()),
          ),
        ),
      );

  /// UI item for showing
  Widget _buildCard(String text) => Builder(
        builder: (context) => SizedBox(
          height: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Material(
              color: Colors.lime,
              child: Center(
                child: Text(
                  text,
                  style: AppTextStyles.normalStyle,
                ),
              ),
            ),
          ),
        ),
      );
}
