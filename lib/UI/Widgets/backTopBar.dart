import 'package:flutter/material.dart';
import 'package:mujinsight/UI/Home/homescreen.dart';

class BackTopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double ht = MediaQuery.of(context).size.height;
    double wt = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white
      ),
      padding: EdgeInsets.fromLTRB(wt * 0.02, ht * 0.04, wt * 0.02, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.orange,
                border: Border.all(color: Colors.white, width: 3),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(blurRadius: 2, color: Colors.grey[600])]),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Image(
            width: wt*0.5,
              height: ht*0.075,
                image: AssetImage('asset/mujbanner.png'),
                fit: BoxFit.fill,
                ),
          Container(
            decoration: BoxDecoration(
                color: Colors.orange,
                border: Border.all(color: Colors.white, width: 3),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(blurRadius: 2, color: Colors.grey[600])]),
            child: IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => HomeScreen(
                        
                      )));
              },
            ),
          )
        ],
      ),
    );
  
  }
}