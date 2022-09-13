import 'package:flutter/material.dart';
import 'package:good_framework/z_constants/constants.dart';


class ImageContentWidget extends StatelessWidget {
  const ImageContentWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var img = const AssetImage(AppAsserts.okkiImage);
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: img,
                height: 200.0,
                width: 200.0,
                fit: BoxFit.fill,
              ),
              Image(
                image: img,
                height: 200.0,
                width: 200.0,
                fit: BoxFit.contain,
              ),
              Image(
                image: img,
                height: 200.0,
                width: 200.0,
                fit: BoxFit.cover,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: img,
                height: 200.0,
                width: 200.0,
                fit: BoxFit.fitWidth,
              ),
              Image(
                image: img,
                height: 200.0,
                width: 200.0,
                fit: BoxFit.fitHeight,
              ),
            ],
          ),
        ]);
  }
}

