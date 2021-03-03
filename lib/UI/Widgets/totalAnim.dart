import 'package:flutter/material.dart';

class TotalAnim extends StatefulWidget {
  String title;
  double totalValue;

  TotalAnim({this.title, this.totalValue});

  @override
  _TotalAnimState createState() => _TotalAnimState();
}

class _TotalAnimState extends State<TotalAnim>
    with SingleTickerProviderStateMixin {
  AnimationController controllerTF;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controllerTF = AnimationController(
        lowerBound: 0,
        upperBound: widget.totalValue,
        duration: Duration(seconds: 2),
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
                    "${widget.title} ${controllerTF.value.toStringAsFixed(0)}+",
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20,
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
