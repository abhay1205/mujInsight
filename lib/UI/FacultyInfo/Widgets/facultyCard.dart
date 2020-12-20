import 'package:flutter/material.dart';

class FacultyCard extends StatefulWidget {
  String name;
  double number, program, school, faculties, departments;
  FacultyCard({this.name, this.number, this.program, this.school, this.faculties, this.departments});
  @override
  _FacultyCardState createState() => _FacultyCardState();
}

class _FacultyCardState extends State<FacultyCard>
    with SingleTickerProviderStateMixin {
  AnimationController controllerTF;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    
  }

  @override
  Widget build(BuildContext context) {
    double ht = MediaQuery.of(context).size.height;
    double wt = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.white, width: 3),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(blurRadius: 2, color: Colors.grey[600])]),
      // margin: EdgeInsets.only(top: ht * 0.05),
      padding: EdgeInsets.all(10),
      alignment: Alignment.topLeft,
      height: ht * 0.3,
      width: wt * 0.4,
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
              text:
                  "Faculty of\n",
              style: TextStyle(
                  fontSize: ht * 0.02,
                  letterSpacing: 1,
                  wordSpacing: 2,
                  color: Colors.black54,
                  fontWeight: FontWeight.w600)),
          TextSpan(
              text:
                  '${widget.name}\n\n',
              style: TextStyle(
                  fontSize: ht * 0.025,
                  letterSpacing: 1,
                  wordSpacing: 2,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600)),
                   TextSpan(
              text:
                  'School: ${widget.school.floor().toString()}\n',
              style: TextStyle(
                  fontSize: ht * 0.02,
                  letterSpacing: 1,
                  wordSpacing: 2,
                  color: Colors.black54,
                  fontWeight: FontWeight.w600)),
                  TextSpan(
              text:
                  'Programs: ${widget.program.floor().toString()}\n',
              style: TextStyle(
                  fontSize: ht * 0.02,
                  letterSpacing: 1,
                  wordSpacing: 2,
                  color: Colors.black54,
                  fontWeight: FontWeight.w600)),
                  TextSpan(
              text:
                  'Department:  ${widget.departments.floor().toString()}\n',
              style: TextStyle(
                  fontSize: ht * 0.02,
                  letterSpacing: 1,
                  wordSpacing: 2,
                  color: Colors.black54,
                  fontWeight: FontWeight.w600)),
                  TextSpan(
              text:
                  'Faculties:  ${widget.faculties.floor().toString()}\n',
              style: TextStyle(
                  fontSize: ht * 0.02,
                  letterSpacing: 1,
                  wordSpacing: 2,
                  color: Colors.black54,
                  fontWeight: FontWeight.w600)),
        ]),
      ),
    );
  }
}
