import 'package:flutter/material.dart';

class TotalFaculties extends StatefulWidget {
  @override
  _TotalFacultiesState createState() => _TotalFacultiesState();
}

class _TotalFacultiesState extends State<TotalFaculties>
    with SingleTickerProviderStateMixin {
  AnimationController controllerTF;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controllerTF = AnimationController(
        lowerBound: 0,
        upperBound: 480,
        duration: Duration(seconds: 4),
        vsync: this);
    controllerTF.forward();

    controllerTF.addListener(() {
      setState(() {
        // print(controllerTF.value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double ht = MediaQuery.of(context).size.height;
    double wt = MediaQuery.of(context).size.width;
    return Container(
      child: Container(
        margin: EdgeInsets.only(top: ht * 0.015, left: wt * 0.02),
        alignment: Alignment.topLeft,
        child: RichText(
          text: TextSpan(children: [
            TextSpan(
                text:
                    "Total Faculties ${controllerTF.value.toStringAsFixed(0)}",
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: ht * 0.04,
                    letterSpacing: 1,
                    wordSpacing: 2,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600)),
          ]),
        ),
      ),
    );
  }
}
