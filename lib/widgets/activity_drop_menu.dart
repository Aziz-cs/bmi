import 'package:bmi/calculator_brain.dart';
import 'package:bmi/screens/results_page/components/bmr_results_card.dart';
import 'package:flutter/material.dart';

enum UserActivity {
  none,
  sedentaryActive,
  lightlyActive,
  moderatelyActive,
  highlyActive,
  superActive
}
List<String> activityList = [
  'Select Activity level',
  'Sedentary (little or no exercise)',
  'Lightly active (light exercise or sports 1-3 days/week)',
  'Moderately active (moderate exercise 3-5 days/week)',
  'Highly active (hard exercise 6-7 days/week)',
  'Super active (very hard exercise and a physical job)',
];

class ActivityDropMenu extends StatefulWidget {
  ActivityDropMenu({this.calc});
  final CalculatorBrain calc;
  static UserActivity userActivity = UserActivity.none;
  static String dropMenuValue = "Select Activity level";
  @override
  _ActivityDropMenuState createState() => _ActivityDropMenuState();
}

class _ActivityDropMenuState extends State<ActivityDropMenu> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: ActivityDropMenu.dropMenuValue,
      isExpanded: true,
      items: activityList.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              value,
              style: TextStyle(
                color: Colors.pink.shade50,
                fontSize: 18,
              ),
            ),
          ),
        );
      }).toList(),
      onChanged: (selectedValue) {
        ActivityDropMenu.userActivity = getUserActivity(selectedValue);

        setState(() {
          ActivityDropMenu.dropMenuValue = selectedValue;
          if (widget.calc != null)
            widget.calc.calcBMRWithActivity(ActivityDropMenu.userActivity);
        });
      },
    );
  }

  UserActivity getUserActivity(String selectedValue) {
    if (selectedValue == activityList[0]) {
      ActivityDropMenu.userActivity = UserActivity.none;
    } else if (selectedValue == activityList[1]) {
      ActivityDropMenu.userActivity = UserActivity.sedentaryActive;
    } else if (selectedValue == activityList[2]) {
      ActivityDropMenu.userActivity = UserActivity.lightlyActive;
    } else if (selectedValue == activityList[3]) {
      ActivityDropMenu.userActivity = UserActivity.moderatelyActive;
    } else if (selectedValue == activityList[4]) {
      ActivityDropMenu.userActivity = UserActivity.highlyActive;
    } else if (selectedValue == activityList[5]) {
      ActivityDropMenu.userActivity = UserActivity.superActive;
    } else {
      ActivityDropMenu.userActivity = UserActivity.sedentaryActive;
    }
    return ActivityDropMenu.userActivity;
  }
}
