import 'package:flutter/material.dart';
import 'package:mujinsight/UI/FacultyInfo/Departmentwise/deptDetails.dart';
import 'package:mujinsight/UI/Widgets/backTopBar.dart';

class SchoolDetails extends StatefulWidget {
  String name;
  int dNum, program;
  SchoolDetails({this.name, this.dNum, this.program});
  @override
  _SchoolDetailsState createState() => _SchoolDetailsState();
}

class _SchoolDetailsState extends State<SchoolDetails> {
  @override
  Widget build(BuildContext context) {
    double ht = MediaQuery.of(context).size.height;
    double wt = MediaQuery.of(context).size.width;
    print(widget.name);
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
          children: [
            BackTopBar(),
            schoolName(ht, wt, widget.name),
            Container(
              height: ht * 0.77,
              child: ListView.builder(
                  itemCount: widget.dNum,
                  itemBuilder: (context, index) {
                    return Container(
                      height: ht * 0.25,
                      margin: EdgeInsets.symmetric(
                          horizontal: wt * 0.05, vertical: ht * 0.01),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white, width: 3),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(blurRadius: 2, color: Colors.grey[600])
                          ]),
                      child: depInfo(ht, wt, index),
                    );
                  }),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.orange,
        onPressed: (){}, label: Text('Info-Graphics', style:TextStyle(color: Colors.white, fontWeight: FontWeight.w600)))
    );
  }
  Widget schoolName(double ht, double wt, String name) {
    return Container(
      margin: EdgeInsets.only(top: ht * 0.03, left: wt * 0.02),
      alignment: Alignment.topLeft,
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
              text: 'School of ',
              style: TextStyle(
                  fontSize: ht * 0.02,
                  letterSpacing: 1,
                  wordSpacing: 2,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600)),
          TextSpan(
              text: widget.name,
              style: TextStyle(
                  fontSize: ht * 0.035,
                  letterSpacing: 1,
                  wordSpacing: 2,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600))
        ]),
      ),
    );
  }

  Widget depInfo(double ht, double wt, int i){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
          
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: 'Department Name ${i + 1}\n',
                        style: TextStyle(
                            fontSize: ht * 0.02,
                            letterSpacing: 1,
                            wordSpacing: 2,
                            color: Colors.black54,
                            fontWeight: FontWeight.w600)),
                    TextSpan(
                        text: 'Programs: 10\n',
                        style: TextStyle(
                            fontSize: ht * 0.02,
                            letterSpacing: 1,
                            wordSpacing: 2,
                            color: Colors.black54,
                            fontWeight: FontWeight.w600)),
                    // TextSpan(
                    //     text: 'Department: 3\n',
                    //     style: TextStyle(
                    //         fontSize: ht * 0.02,
                    //         letterSpacing: 1,
                    //         wordSpacing: 2,
                    //         color: Colors.black54,
                    //         fontWeight: FontWeight.w600)),
                  ]),
                ),
                // Container(
                //   alignment: Alignment.centerLeft,
                //   child: Text('${controllerTF.value.toStringAsFixed(0)} Faculties'),
                // ),
                // Container(
                //   child: Row(
                //     children: [
                //       Container(
                //         decoration: BoxDecoration(
                //                 color: Colors.orange,
                //                 // border: Border.all(color: Colors.white, width: 3),
                //                 borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
                //                 boxShadow: [
                //                   BoxShadow(blurRadius: 3, color: Colors.grey[400])
                //                 ]),
                //         padding: EdgeInsets.only(left: 10),
                //         height: ht*0.05,
                //         child: controllerTF.value == 180? 
                //                 Text('Faculties', 
                //                       style: TextStyle(color: Colors.white, letterSpacing: 1, fontWeight: FontWeight.w600),)
                //                 : Text(''),
                //         // color: Colors.orange,
                //         alignment: Alignment.centerLeft,
                //         width: controllerTF.value*0.9,
                //       ),
                //       Text(' ${controllerTF.value.toStringAsFixed(0)}', style: TextStyle(color: Colors.black54,
                //             fontWeight: FontWeight.w600),)
                //     ],
                //   ),
                // ),
                
                // SizedBox(height: 10,),
                // Container(
                //   child: Row(
                //     children: [
                //       Container(
                //         decoration: BoxDecoration(
                //                 color: Colors.orange,
                               
                //                 borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
                //                 boxShadow: [
                //                   BoxShadow(blurRadius: 3, color: Colors.grey[400])
                //                 ]),
                //         padding: EdgeInsets.only(left: 10),
                //         height: ht*0.05,
                //         child: controllerTS.value == 600? Text('Students',
                //         style: TextStyle(color: Colors.white, letterSpacing: 1, fontWeight: FontWeight.w600),): Text(''),
                        
                //         alignment: Alignment.centerLeft,
                //         width: controllerTS.value*0.4,
                //       ),
                //       Text(' ${controllerTS.value.toStringAsFixed(0)}', style: TextStyle(color: Colors.black54,
                //             fontWeight: FontWeight.w600),)
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
          IconButton(
            icon:Icon(Icons.arrow_forward_ios),
            onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => DepartmentDetails( name: 'Bussines',))),),
            
        ],
      ),
    );
  }
}
