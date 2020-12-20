import 'package:flutter/material.dart';
import 'package:mujinsight/UI/FacultyInfo/facultyInfo.dart';
import 'package:mujinsight/UI/Home/homescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Roboto',
        textTheme: TextTheme(subtitle1: TextStyle(fontFamily: 'Roboto'))
      ),
      debugShowCheckedModeBanner: false,
      title: 'MUJ Insight',
      home: HomeScreen(),
    );
  }
}
