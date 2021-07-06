import 'dart:ui';

import 'package:bmi/calculator_brain.dart';
import 'package:bmi/screens/input_page/components/round_icon_btn.dart';
import 'package:bmi/screens/results_page/results_page.dart';
import 'package:bmi/widgets/activity_drop_menu.dart';
import 'package:bmi/widgets/bottom_btn.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants.dart';
import 'components/icon_content.dart';
import 'components/resuable_card.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  CalculatorBrain resultsFile;
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          "assets/images/app_icon.png",
          height: 10,
        ),
        title: Text(
          "BMI IBW BMR Calculator",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              icon: Icon(
                Icons.info,
                color: Colors.pink[100],
              ),
              onPressed: () => showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 50),
                  child: AlertDialog(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "assets/images/app_icon.png",
                                  width: 40,
                                  height: 50,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'BMI IBW BMR',
                                      style: TextStyle(
                                        color: Colors.pink[50],
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Calculator v1.0',
                                      style: TextStyle(
                                        color: Colors.pink[50],
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Text(
                                  'Developed By:  ',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17),
                                ),
                                Text("Aziz.cs",
                                    style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      color: Colors.pink[100],
                                    )),
                                SizedBox(
                                  width: 4,
                                ),
                                FlutterLogo(
                                  size: 20,
                                  style: FlutterLogoStyle.markOnly,
                                  curve: Curves.bounceInOut,
                                  duration: Duration(seconds: 4),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.email,
                                  size: 20,
                                  color: Colors.pink[200],
                                ),
                                const SizedBox(width: 4),
                                Text("aziz.egy@gmail.com",
                                    style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      height: 1.3,
                                      color: Colors.pink[100],
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    content: Column(
                      children: [
                        Text(
                            "- Body mass index (BMI) is a value derived from the weight and height of a person."),
                        Text(
                            "- ARDSnet formulas are used to calculate the Ideal Body Weight."),
                        Text(
                            "- Mifflin-St Jeor formula is used to calculate the Basal Metabolic Rate."),
                      ],
                    ),
                    actions: [
                      // FlatButton(
                      //   textColor: Theme.of(context).accentColor,
                      //   child: Text(
                      //     "CONTACT",
                      //     style: TextStyle(
                      //       color: Colors.pink[100],
                      //       fontSize: 17,
                      //     ),
                      //   ),
                      //   onPressed: () async {},
                      // ),
                      FlatButton(
                          textColor: Theme.of(context).accentColor,
                          child: Text(
                            'CLOSE',
                            style: TextStyle(
                              color: Colors.pink[100],
                              fontSize: 17,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: selectedGender == Gender.male
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      iconColor: selectedGender == Gender.male
                          ? Colors.pink
                          : Colors.white,
                      label: "MALE",
                      textStyle: selectedGender == Gender.male
                          ? kLabelTextStyleClicked
                          : kLabelTextStyle,
                    ),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: selectedGender == Gender.female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: IconContent(
                      iconColor: selectedGender == Gender.female
                          ? Colors.pink
                          : Colors.white,
                      icon: FontAwesomeIcons.venus,
                      label: "FEMALE",
                      textStyle: selectedGender == Gender.female
                          ? kLabelTextStyleClicked
                          : kLabelTextStyle,
                    ),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: ReusableCard(
              color: kInactiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        "cm",
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTickMarkColor: Colors.pink.shade200,
                      inactiveTrackColor: Colors.pink.shade100.withOpacity(0.3),
                      // inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: kBottomContainerColour,
                      overlayColor: Color(0x29EB1555),
                      thumbColor: Colors.pink,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      onChanged: (value) {
                        setState(() {
                          height = value.round();
                        });
                      },
                    ),
                  ),
                  ActivityDropMenu(calc: resultsFile),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: kInactiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "WEIGHT",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconBtn(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                            RoundIconBtn(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    onPress: () {},
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kInactiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "AGE",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconBtn(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                            RoundIconBtn(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    onPress: () {},
                  ),
                ),
              ],
            ),
          ),
          BottomBtn(
            label: "CALCULATE",
            onPress: () {
              print(ActivityDropMenu.dropMenuValue);
              print(ActivityDropMenu.userActivity);
              if (selectedGender == null) {
                displaySnack(context, "Please select your Gender");
              } else if (ActivityDropMenu.userActivity == UserActivity.none) {
                displaySnack(context, "Please select your Activity level");
              } else {
                resultsFile = CalculatorBrain(
                  age: age,
                  gender: selectedGender,
                  weight: weight,
                  height: height,
                );
                resultsFile.getBMIValue();
                resultsFile.getBMRValue();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ResultPage(
                    resultsFile: resultsFile,
                  ),
                ));
              }
            },
          )
        ],
      ),
    );
  }
}

void displaySnack(BuildContext context, String message) {
  final snackBar = SnackBar(
    duration: Duration(seconds: 2),
    content: Text(
      message,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
    ),
    backgroundColor: kPrimaryColor,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
