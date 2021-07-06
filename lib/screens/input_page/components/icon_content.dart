import 'package:bmi/constants.dart';
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  IconContent({
    this.label,
    this.icon,
    this.iconColor,
    this.textStyle,
  });
  final String label;
  final IconData icon;
  final Color iconColor;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: iconColor,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          label,
          style: textStyle,
        ),
      ],
    );
  }
}
