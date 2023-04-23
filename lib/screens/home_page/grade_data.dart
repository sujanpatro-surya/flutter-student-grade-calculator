import 'package:flutter/material.dart';

import '../../modal/lesson.dart';

class Grades{
  static List<String> _letterGrade() {
    return ['O', 'E', 'A', 'B', 'C'];
  }

  static int _numberGrade(String letter) {
    switch(letter) {
      case 'O': return 10;
      case 'E': return 9;
      case 'A': return 8;
      case 'B': return 7;
      case 'C': return 6;
      default: return 0;
    }
  }

  static List<int> _allCredits() {
    return List.generate(5, (index) => index + 1);
  }

  static List<DropdownMenuItem<int>> letterGradeItems() {
    return _letterGrade().map((letter) =>
      DropdownMenuItem(value: _numberGrade(letter), child: Text(letter))
    ).toList();
  }

  static List<DropdownMenuItem<int>> creditItems() {
    return _allCredits().map((credit) =>
      DropdownMenuItem(value: credit, child: Text(credit.toString()))
    ).toList();
  }

  static List<Lesson> allLessons = [];

  static double getAverage() {
    double scoredPoints = 0, totalPoints = 0;
    if (allLessons.isEmpty) return 0;
    for (Lesson lesson in allLessons) {
      scoredPoints += lesson.grade! * lesson.credit!;
      totalPoints += lesson.credit!;
    }
    return scoredPoints/totalPoints;
  }
}
