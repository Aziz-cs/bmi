import 'package:bmi/screens/results_page/results_page.dart';
import 'package:flutter/material.dart';
import 'package:bmi/constants.dart';

class BottomBtn extends StatelessWidget {
  BottomBtn({this.label, this.onPress});
  final Function onPress;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
            color: kBottomContainerColour,
          ),
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              label,
              style: kLargeButtonTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
