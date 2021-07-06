import 'package:bmi/calculator_brain.dart';
import 'package:flutter/material.dart';

const kSubtitleSizeOfResult = 17.0;
const kSubtitleSizeOfOtherResult = 13.0;
const kResultHeight = 0.0;
const kDefaultHeight = 15.0;

String leftTitle;
String leftsubTitle;
String midTitle;
String midSubTitle;
String rightTitle;
String rightSubTitle;

class BMIResultBar extends StatelessWidget {
  BMIResultBar({this.resultType});
  final BMIResult resultType;
  @override
  Widget build(BuildContext context) {
    initlizeResults(resultType);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: _buildResultColumn(
            title: leftTitle,
            subtitle: leftsubTitle,
            fontColor: Colors.grey.withOpacity(0.7),
            height: kDefaultHeight,
            subTitleFontSize: kSubtitleSizeOfOtherResult,
            fontWeight: FontWeight.normal,
          ),
        ),
        Expanded(
          flex: 3,
          child: _buildResultColumn(
            title: midTitle,
            subtitle: midSubTitle,
            fontColor: resultType == BMIResult.normal
                ? Colors.green
                : resultType == BMIResult.overweight
                    ? Colors.red
                    : Colors.blue,
            height: kResultHeight,
            subTitleFontSize: kSubtitleSizeOfResult,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: _buildResultColumn(
            title: rightTitle,
            subtitle: rightSubTitle,
            fontColor: Colors.grey.withOpacity(0.7),
            height: kDefaultHeight,
            subTitleFontSize: kSubtitleSizeOfOtherResult,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget _buildResultColumn({
    String title,
    String subtitle,
    double subTitleFontSize,
    Color fontColor,
    FontWeight fontWeight,
    double height,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: height,
          ),
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              title,
              style: TextStyle(
                color: fontColor,
                fontWeight: fontWeight,
              ),
            ),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: subTitleFontSize,
                color: fontColor,
                fontWeight: fontWeight,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void initlizeResults(BMIResult result) {
    switch (result) {
      case BMIResult.underweight:
        leftTitle = "Overweight";
        leftsubTitle = "=< 25";
        midTitle = "UNDERWEIGHT";
        midSubTitle = "=< 18.5";
        rightTitle = "Normal";
        rightSubTitle = "8.5-24.9";
        break;
      case BMIResult.normal:
        leftTitle = "Underweight";
        leftsubTitle = "=< 18.5";
        midTitle = "NORMAL";
        midSubTitle = "8.5-24.9";
        rightTitle = "Overweight";
        rightSubTitle = "=< 25";
        break;
      case BMIResult.overweight:
        leftTitle = "Normal";
        leftsubTitle = "8.5-24.9";
        midTitle = "OVERWEIGHT";
        midSubTitle = "=< 25";
        rightTitle = "Underweight";
        rightSubTitle = "=< 18.5";
        break;
    }
  }
}
