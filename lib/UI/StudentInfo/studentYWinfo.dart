import 'package:flutter/material.dart';
import 'package:mujinsight/UI/StudentInfo/studentsFWinfo.dart';
import 'package:mujinsight/UI/Widgets/backTopBar.dart';
import 'package:mujinsight/UI/Widgets/totalAnim.dart';

class StudentYWinfo extends StatefulWidget {

  @override
  _StudentYWinfoState createState() => _StudentYWinfoState();
}

class _StudentYWinfoState extends State<StudentYWinfo> {
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
              children: [
                BackTopBar(),
                SingleChildScrollView(
                  child: StudentYW()
                 
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StudentYW extends StatefulWidget {
  @override
  _StudentYWState createState() => _StudentYWState();
}

class _StudentYWState extends State<StudentYW>
    with TickerProviderStateMixin {
  List<String> faculties = [
    'First Year',
    'Second Year',
    'Third Year',
    'Fourth Year'

  ];

  AnimationController controllerCard;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllerCard = AnimationController(
        duration: Duration(seconds: 1, milliseconds: 500), vsync: this);
    controllerCard.forward();    
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controllerCard.dispose();
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double ht = MediaQuery.of(context).size.height;
    double wt = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
          child: Container(
          padding: EdgeInsets.only(
            top: ht * 0.03,
            left: wt * 0.02,
            right: wt * 0.02,
          ),
          height: ht * 0.9,
          width: wt,
          child: ListView(
            children: [
              TotalAnim(title: 'Students', totalValue: 7000.0,),
              
              Container(
                padding: EdgeInsets.only(top:20),
                height: ht * 0.75,
                child: ListView.builder(
                  itemCount: faculties.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: AnimatedItem(
                        startDelayFraction: 0.00,
                        controller: controllerCard,
                        child: AnimCategoryContainer(CategoryBean(
                            title: faculties[index],
                            categoryItems: [
                              CategoryBean(
                                  quantity: 50,
                                  title: 'Admission',
                                  isGraph: true),
                              CategoryBean(
                                  quantity: 100,
                                  title: 'Registered',
                                  isGraph: true),
                              CategoryBean(
                                  quantity: 20, title: 'Withdrawl',
                                  isGraph: true),
                              CategoryBean(
                                  quantity: 200, title: 'Alumni',
                                  isGraph: true),
                              // CategoryBean(widgget: Container(
                                
                              //   alignment: Alignment.centerRight,
                              //   child: FlatButton(
                              //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              //     color: Colors.orange,
                              //     onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => YearInfo())),
                              //     child: Text('View Department Wise', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),))), isGraph: false),
                            ],
                            onTap: () {}
                            )),
                      ),
                    );
                  },
                ),
              ),
            ],
          )),
    );
  }
}