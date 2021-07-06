import 'package:bmi/constants.dart';
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({
    @required this.color,
    this.cardChild,
    this.onPress,
  });

  final Color color;
  final Widget cardChild;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6),
        height: double.infinity,
        child: cardChild,
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
