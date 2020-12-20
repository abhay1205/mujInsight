import 'package:flutter/material.dart';
import 'package:mujinsight/UI/FacultyInfo/Schoolwise/schoolList.dart';
import 'package:mujinsight/UI/FacultyInfo/Widgets/facultyCard.dart';
import 'package:mujinsight/UI/FacultyInfo/Widgets/totalFaculty.dart';
import 'package:mujinsight/UI/FacultyInfo/departmentWise.dart';
import 'package:mujinsight/UI/FacultyInfo/facultyWise.dart';
import 'package:mujinsight/UI/FacultyInfo/schololWise.dart';
import 'package:mujinsight/UI/Widgets/backTopBar.dart';
import 'package:mujinsight/UI/Widgets/topBar.dart';

class FacultyInfo extends StatefulWidget {
  @override
  _FacultyInfoState createState() => _FacultyInfoState();
}

class _FacultyInfoState extends State<FacultyInfo> {
  int currTab = 0;
  Widget currScreen = FacultyWise();
  @override
  Widget build(BuildContext context) {
    double ht = MediaQuery.of(context).size.height;
    double wt = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.white, Colors.grey[100]],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.2, 0.4])),
        height: ht,
        child: Column(
          children: [BackTopBar(), TotalFaculties(), currScreen],
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
                    child: Text('Faculty',
                        style: TextStyle(
                            color: currTab == 0 ? Colors.white : Colors.black,
                            fontSize: ht * 0.018,
                            letterSpacing: 1,
                            wordSpacing: 2,
                            fontWeight: FontWeight.w600)),
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
                    child: Text('Schools',
                    style: TextStyle(
                            color: currTab == 1 ? Colors.white : Colors.black,
                            fontSize: ht * 0.018,
                            letterSpacing: 1,
                            wordSpacing: 2,
                            fontWeight: FontWeight.w600)),
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
                    child: Text('Department',
                    style: TextStyle(
                            color: currTab == 2 ? Colors.white : Colors.black,
                            fontSize: ht * 0.018,
                            letterSpacing: 1,
                            wordSpacing: 2,
                            fontWeight: FontWeight.w600)),
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

  Widget facultyGrid(double ht, double wt) {
    return Container(
      padding: EdgeInsets.only(
        top: ht * 0.03,
        left: wt * 0.02,
        right: wt * 0.02,
      ),
      height: ht * 0.82,
      width: wt,
      child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(5),
        crossAxisSpacing: 15,
        mainAxisSpacing: 20,
        crossAxisCount: 2,
        children: <Widget>[
          FacultyCard(
            name: 'Science',
            program: 12,
            school: 1,
            departments: 5,
            faculties: 65,
          ),
          FacultyCard(
            name: 'Engineering',
            program: 12,
            school: 4,
            departments: 10,
            faculties: 40,
          ),
          FacultyCard(
            name: 'Arts and Law',
            program: 12,
            school: 3,
            departments: 3,
            faculties: 40,
          ),
          FacultyCard(
            name: 'Design',
            program: 12,
            school: 2,
            departments: 2,
            faculties: 40,
          ),
          GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => SchoolPage(
                        sNum: 3,
                        name: 'Management & Commerce',
                      ))),
              child: FacultyCard(
                name: 'Management & Commerce',
                program: 8,
                school: 3,
                departments: 3,
                faculties: 46,
              )),
        ],
      ),
    );
  }
}
