import 'package:flutter/material.dart';

import '../constants.dart';

class icon_textcard extends StatelessWidget {
  icon_textcard({this.icon, this.label});
  final IconData? icon;
  final String? label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 100,
        ),
        SizedBox(height: 15),
        Text(
          label!,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
