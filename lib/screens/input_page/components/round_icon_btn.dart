import 'package:flutter/material.dart';

class RoundIconBtn extends StatelessWidget {
  RoundIconBtn({this.icon, this.onPressed});
  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        color: Colors.pink.shade100,
      ),
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 70,
        height: 70,
      ),
      fillColor: Color(0xFF4C4F5E),
      shape: CircleBorder(),
      onPressed: onPressed,
    );
  }
}
