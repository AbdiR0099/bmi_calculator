import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  RoundButton({required this.icon, this.onTap});
  final IconData icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onTap,
      fillColor: Color(0xFF4C4F5E),
      elevation: 6,
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}
