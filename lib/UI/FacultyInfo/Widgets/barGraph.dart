import 'package:flutter/material.dart';

class BarGraph extends StatefulWidget {
  String title;
  double prof;
  BarGraph({this.title, this.prof});
  @override
  _BarGraphState createState() => _BarGraphState();
}

class _BarGraphState extends State<BarGraph> {

  @override
  Widget build(BuildContext context) {
    double ht = MediaQuery.of(context).size.height;
    double wt = MediaQuery.of(context).size.width;
    return Container(
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.orange,
                // border: Border.all(color: Colors.white, width: 3),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(5),
                    topRight: Radius.circular(5)),
                boxShadow: [BoxShadow(blurRadius: 3, color: Colors.grey[400])]),
            padding: EdgeInsets.only(left: 10),
            height: 25,
            // child: Text(
            //         widget.title,
            //         style: TextStyle(
            //             color: Colors.white,
            //             letterSpacing: 1,
            //             fontWeight: FontWeight.w600),
            //       ),
                
            // color: Colors.orange,
            alignment: Alignment.centerLeft,
            width: widget.prof* 0.9,
          ),
          Text(
            '  ${widget.prof.floor()} ${widget.title}',
            style:
                TextStyle(color: Colors.black54, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
