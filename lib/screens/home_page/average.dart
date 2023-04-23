import 'package:flutter/material.dart';
import 'package:grade_calculator/constants.dart';

class ShowAverage extends StatelessWidget {
  const ShowAverage({Key? key, required this.average, required this.numberOfLessons}) : super(key: key);
  final double average;
  final int numberOfLessons;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            numberOfLessons > 0 ?
              '$numberOfLessons ${
                numberOfLessons > 1 ?
                  Constants.pluralLesson :
                  Constants.singularLesson
              }' :
            Constants.noLessonMessage,
            style: Constants.lessonStyle,
          ),
          Text(
            average >= 0 ? average.toStringAsFixed(1) : '0.00',
            style: Constants.averageStyle),
          Text(Constants.gradeType, style: Constants.lessonStyle)
        ],
      ),
    );
  }
}
