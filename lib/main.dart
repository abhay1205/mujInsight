import 'package:flutter/material.dart';
import 'package:mujinsight/UI/Auth/loginscreen.dart';
import 'package:mujinsight/UI/AwardsInfo/awardsFWinfo.dart';
import 'package:mujinsight/UI/FacultyInfo/facultyFWinfo.dart';
import 'package:mujinsight/UI/FacultyInfo/facultyInfo.dart';
import 'package:mujinsight/UI/FunctionalUnitsInfo/fuInfo.dart';
import 'package:mujinsight/UI/Home/homescreen.dart';
import 'package:mujinsight/UI/PlacementInfo/placementFWinfo.dart';
import 'package:mujinsight/UI/ProgramInfo/programFWinfo.dart';
import 'package:mujinsight/UI/ResearchInfo/researchFWinfo.dart';
import 'package:mujinsight/UI/StatutoryMeetingInfo/EC/meetingInfo.dart';
import 'package:mujinsight/UI/StudentInfo/studentsFWinfo.dart';
import 'package:mujinsight/loginHelper.dart';
import 'package:mujinsight/utils/sharedPref.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp>  {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Roboto',
        textTheme: TextTheme(subtitle1: TextStyle(fontFamily: 'Roboto'))
      ),
      debugShowCheckedModeBanner: false,
      title: 'MUJ Insight',
      home: LoggedInLogic(),
      routes: {
        '/home': (context)=>HomeScreen(),
        '/fInfo': (context)=>FacultyFWinfo(),
        '/sInfo': (context)=>StudentFWinfo(),
        '/pInfo': (context)=>PlacementFWinfo(),
        '/rInfo': (context)=>ResearchFWinfo(),
        '/aInfo': (context)=>AwardsFWinfo(),
        '/pfwInfo': (context)=>ProgramFWinfo(),
        '/fuInfo': (context)=>FUInfo(),
        '/mInfo': (context)=>SMeetingInfo(),
        
      },
    );
  }
}
