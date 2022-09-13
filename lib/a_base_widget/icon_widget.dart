import 'package:flutter/material.dart';

class IconContentWidget extends StatelessWidget {
  const IconContentWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(Icons.accessible, color: Colors.green),
            Icon(Icons.error, color: Colors.green),
            Icon(
              Icons.fingerprint,
              color: Colors.red,
              size: 30,
            ),
            Icon(Icons.access_alarm_outlined, color: Colors.green),
            Icon(
              Icons.baby_changing_station_rounded,
              color: Colors.green,
              size: 60,
            ),
            Icon(Icons.safety_divider_rounded, color: Colors.yellow),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(Icons.one_x_mobiledata, color: Colors.green),
            Icon(Icons.g_mobiledata, color: Colors.pink),
            Icon(
              Icons.g_translate_rounded,
              color: Colors.red,
              size: 30,
            ),
            Icon(Icons.mail, color: Colors.red),
            Icon(
              Icons.face_retouching_natural_outlined,
              color: Colors.green,
              size: 20,
            ),
            Icon(Icons.baby_changing_station_rounded, color: Colors.yellow),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(
              Icons.accessible,
              color: Colors.black12,
              size: 13,
            ),
            Icon(Icons.tab, color: Colors.green),
            Icon(
              Icons.h_mobiledata,
              color: Colors.red,
              size: 30,
            ),
            Icon(Icons.access_alarm_rounded, color: Colors.green),
            Icon(
              Icons.garage_rounded,
              color: Colors.green,
              size: 20,
            ),
            Icon(Icons.cached_rounded, color: Colors.yellow),
          ],
        ),
      ],
    );
  }
}

