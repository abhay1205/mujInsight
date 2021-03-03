import 'package:flutter/material.dart';
import 'package:mujinsight/UI/FacultyInfo/Schoolwise/schoolList.dart';
import 'package:mujinsight/UI/FacultyInfo/Widgets/facultyCard.dart';
import 'package:mujinsight/UI/FacultyInfo/Widgets/totalFaculty.dart';
import 'package:mujinsight/UI/FacultyInfo/departmentWise.dart';
import 'package:mujinsight/UI/FacultyInfo/facultyWise.dart';
import 'package:mujinsight/UI/FacultyInfo/schololWise.dart';
import 'package:mujinsight/UI/Widgets/backTopBar.dart';
import 'package:mujinsight/UI/Widgets/topBar.dart';

class SMeetingInfo extends StatefulWidget {
  @override
  _SMeetingInfoState createState() => _SMeetingInfoState();
}

class _SMeetingInfoState extends State<SMeetingInfo> {
  int currTab = 0;
  Widget currScreen = FacultyWise();
  @override
  Widget build(BuildContext context) {
    double ht = MediaQuery.of(context).size.height;
    double wt = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
              child: SingleChildScrollView(
                child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.white, Colors.grey[100]],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.2, 0.4])),
            height: ht,
            child: Column(
              children: [BackTopBar(),
              SingleChildScrollView(
                child: Column(
                  children: [
                     currScreen
                  ],
                ),
              ) 
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        elevation: 10,
        child: Container(
          height: ht * 0.07,
          width: wt,
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(10))),
                    color: currTab == 0 ? Colors.orange : Colors.white,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical:5),
                      child: Text('Board of Management',
                      maxLines: 2,
                      textAlign: TextAlign.end,
                          style: TextStyle(
                              color: currTab == 0 ? Colors.white : Colors.black,
                              fontSize: 13,
                              letterSpacing: 1,
                              wordSpacing: 2,
                              fontWeight: FontWeight.w600)),
                    ),
                    onPressed: () {
                      setState(() {
                        currTab = 0;
                        currScreen = FacultyWise();
                      });
                    }),
              ),
              Expanded(
                child: FlatButton(
                    color: currTab == 1 ? Colors.orange : Colors.white,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical:5),
                      child: Text('Executive Council',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                              color: currTab == 1 ? Colors.white : Colors.black,
                              fontSize: 13,
                              letterSpacing: 1,
                              wordSpacing: 2,
                              fontWeight: FontWeight.w600)),
                    ),
                    onPressed: () {
                      setState(() {
                        currTab = 1;
                        currScreen = SchoolWise();
                      });
                    }),
              ),
              Expanded(
                child: FlatButton(
                    color: currTab == 2 ? Colors.orange : Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.only(bottomRight: Radius.circular(15))),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical:5),
                      child: Text('Academic Council',
                      maxLines: 2,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                              color: currTab == 2 ? Colors.white : Colors.black,
                              fontSize: 13,
                              letterSpacing: 1,
                              wordSpacing: 2,
                              fontWeight: FontWeight.w600)),
                    ),
                    onPressed: () {
                      setState(() {
                        currTab = 2;
                        currScreen = DepartmentWise();
                      });
                    }),
              ),
            ],
          ),
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // floatingActionButton: FloatingActionButton.extended(
      //   backgroundColor: Colors.orange,
      //   onPressed: (){}, label: Text('Info-Graphics', style:TextStyle(color: Colors.black87, fontWeight: FontWeight.w600, letterSpacing: 2)))
    );
  }
}
