import 'package:flutter/material.dart';
import 'package:mujinsight/UI/FacultyInfo/Widgets/barGraph.dart';
import 'package:mujinsight/UI/FacultyInfo/yearInfo.dart';
import 'package:mujinsight/UI/FacultyInfo/yearwise.dart';

class FUInfo extends StatefulWidget {
  @override
  _FUinfoState createState() => _FUinfoState();
}

class _FUinfoState extends State<FUInfo>
    with TickerProviderStateMixin {
  List<String> faculties = [
    'Staff',

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: Text(
                      'MUJ Insights',
                      style: TextStyle(
                          fontFamily: 'Playfair',
                          fontSize: ht * 0.03,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87),
                    ),
      ),
          body: SingleChildScrollView(
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
                              quantity: 95,
                              title: 'Teaching Staff',
                              isGraph: true),
                          CategoryBean(
                              quantity: 5,
                              title: 'IT Staff',
                              isGraph: true),
                          CategoryBean(
                              quantity: 20, title: 'Management Staff',
                              isGraph: true),
                        ],
                        onTap: () {}
                        )),
                  ),
                );
              },
            )),
      ),
    );
  }
}