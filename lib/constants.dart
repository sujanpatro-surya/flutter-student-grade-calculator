import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  Constants._();

  static const String appTitle = 'Student Grade Calculator';
  static const String appBarTitle = 'Calculate Average';
  static const String gradeHint = 'Grades';
  static const String creditHint = 'Credits';
  static const String lessonHint = 'Enter Lesson';
  static const String noLessonMessage = 'Please enter lessons';
  static const String singularLesson = 'Lesson';
  static const String pluralLesson = 'Lessons';
  static const String gradeType = 'GPA';

  static const int defaultGrade = 10;
  static const int defaultCredit = 1;
  static const int formFlexFactor = 2;
  static const double borderRadius = 20;
  static const double horizontalPadding = 10;
  static const double verticalPadding = 5;
  static const double iconSize = 50;
  static const double fieldOpacity = 0.5;

  static const Color transparent = Colors.transparent;
  static const MaterialColor primary = Colors.deepPurple;
  static final TextStyle appBarTitleTextStyle=
  GoogleFonts.lato(
      fontSize: 28,fontWeight: FontWeight.w800, color: Colors.deepPurple);
  static final TextStyle lessonStyle=
  GoogleFonts.lato(
      fontSize: 14,fontWeight: FontWeight.w500, color: Colors.deepPurple);
  static final TextStyle averageStyle=
  GoogleFonts.lato(
      fontSize: 50,fontWeight: FontWeight.w700, color: Colors.deepPurple);
  static final TextStyle hintStyle=
  GoogleFonts.lato(
      fontSize: 14, color: Colors.grey);
}
