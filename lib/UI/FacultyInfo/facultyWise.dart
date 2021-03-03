import 'package:flutter/material.dart';
import 'package:mujinsight/UI/FacultyInfo/Widgets/barGraph.dart';
import 'package:mujinsight/UI/FacultyInfo/yearInfo.dart';
import 'package:mujinsight/UI/FacultyInfo/yearwise.dart';

class FacultyWise extends StatefulWidget {
  @override
  _FacultyWiseState createState() => _FacultyWiseState();
}

class _FacultyWiseState extends State<FacultyWise>
    with TickerProviderStateMixin {
  List<String> faculties = [
    'Faculty of Science',
    'Faculty of Engineering',
    'Faculty of Arts & Law',
    'Faculty of Design',
    'Faculty of Management & Commerce',
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
          height: ht * 0.7,
          width: wt,
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
                            title: 'Assistant Professor',
                            isGraph: true),
                        CategoryBean(
                            quantity: 100,
                            title: 'Associatet Professor',
                            isGraph: true),
                        CategoryBean(
                            quantity: 20, title: 'Professor',
                            isGraph: true),
                        CategoryBean(widgget: Container(
                          
                          alignment: Alignment.centerRight,
                          child: FlatButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            color: Colors.orange,
                            onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => YearInfo())),
                            child: Text('View Year Wise', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),))), isGraph: false),
                      ],
                      onTap: () {}
                      )),
                ),
              );
            },
          )),
    );
  }
}


