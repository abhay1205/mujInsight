import 'package:flutter/material.dart';
import 'package:mujinsight/UI/StudentInfo/studentsFWinfo.dart';
import 'package:mujinsight/UI/Widgets/backTopBar.dart';
import 'package:mujinsight/UI/Widgets/totalAnim.dart';

class PlacementYWinfo extends StatefulWidget {

  @override
  _PlacementYWinfoState createState() => _PlacementYWinfoState();
}

class _PlacementYWinfoState extends State<PlacementYWinfo> {
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
                  child: PlacementYW()
                 
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PlacementYW extends StatefulWidget {
  @override
  _PlacementYWState createState() => _PlacementYWState();
}

class _PlacementYWState extends State<PlacementYW>
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
              TotalAnim(title: 'Placement', totalValue: 150.0,),
              
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
                                  quantity: 120,
                                  title: 'Total Placement',
                                  isGraph: true),
                              CategoryBean(
                                  quantity: 85,
                                  title: '% Placed',
                                  isGraph: true),
                              CategoryBean(
                                  quantity: 36, title: 'Companies Visited',
                                  isGraph: true),
                              CategoryBean(
                                  quantity: 42, title: 'LPA Highest Package',
                                  isGraph: true),
                                  CategoryBean(
                                  quantity: 6, title: 'LPA Avg Package',
                                  isGraph: true),
                                  CategoryBean(
                                  quantity: 3.5, title: 'LPA Lowest Package',
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