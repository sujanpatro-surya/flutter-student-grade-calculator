import 'package:flutter/material.dart';
import 'package:grade_calculator/screens/home_page/home_page.dart';

import 'constants.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appTitle,
      theme: ThemeData(
        primarySwatch: Constants.primary,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: const HomePage(),
    );
  }
}
