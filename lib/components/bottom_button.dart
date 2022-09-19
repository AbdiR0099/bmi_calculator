import 'package:flutter/material.dart';

import '../constants.dart';

class Bottombutton extends StatelessWidget {
  Bottombutton({required this.onTap, required this.buttonTitle});

  final void Function()? onTap;
  final String? buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(bottom: 20),
        color: kBottomColorcontainer,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kBottomContainerHeight,
        child: Center(
          child: Text(
            buttonTitle!,
            style: kBottomTextStyle,
          ),
        ),
      ),
    );
  }
}
