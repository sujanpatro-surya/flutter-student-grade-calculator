import 'package:flutter/material.dart';
import 'package:grade_calculator/constants.dart';
import 'package:grade_calculator/screens/home_page/average.dart';
import 'package:grade_calculator/screens/home_page/grade_data.dart';

import '../../modal/lesson.dart';
import 'create_form.dart';
import 'list_lessons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static int selectedGrade = Constants.defaultGrade;
  static int selectedCredit = Constants.defaultCredit;
  static String? name;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.appBarTitle, style: Constants.appBarTitleTextStyle),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              createForm(_formKey, onChangedName, onChangedGrade, onChangedCredit, onPressedIcon),
              Expanded(child: ShowAverage(average: Grades.getAverage(), numberOfLessons: Grades.allLessons.length))
            ],
          ),
          Expanded(
            child: LessonList(onDismiss: onDismiss),
          )
        ],
      )
    );
  }

  void onChangedGrade(int? newGrade) {
    setState(() {
      HomePage.selectedGrade = newGrade!;
    });
  }

  void onChangedCredit(int? newCredit) {
    setState(() {
      HomePage.selectedCredit = newCredit!;
    });
  }

  void onPressedIcon() {
    setState(() {
      Grades.allLessons.add(Lesson(
        name: HomePage.name!,
        grade: HomePage.selectedGrade,
        credit: HomePage.selectedCredit
      ));
    });
  }

  void onDismiss(int index) {
    setState(() {
      Grades.allLessons.removeAt(index);
    });
  }

  void onChangedName(String value) {
    setState(() {
      HomePage.name = value;
    });
  }
}
