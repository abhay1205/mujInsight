import 'package:flutter/material.dart';
import 'package:mujinsight/UI/Auth/loginscreen.dart';
import 'package:mujinsight/UI/Drawer/profile.dart';
import 'package:mujinsight/UI/Drawer/searchFaculty.dart';
import 'package:mujinsight/UI/EditSection/hod.dart';
import 'package:mujinsight/UI/Home/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HDrawer extends StatefulWidget {
  @override
  _HDrawerState createState() => _HDrawerState();
}

class _HDrawerState extends State<HDrawer> {
  @override
  Widget build(BuildContext context) {
    double ht = MediaQuery.of(context).size.height;
    double wt = MediaQuery.of(context).size.width;
    return Drawer(
      child: Container(
        padding: EdgeInsets.only(
          bottom: ht * 0.01,
        ),
        decoration: BoxDecoration(
            // image: DecorationImage(
            //   colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop),
            //   fit: BoxFit.fitWidth,
            //   image: AssetImage('asset/mujIcon.jpeg')
            // ),
            gradient: LinearGradient(
                colors: [Colors.white, Colors.grey[100]],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0.2, 0.3])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: wt * 0.8,
              height: ht * 0.25,
              // padding: EdgeInsets.only(top:ht*0.1, left: wt*0.05),
              // color: Colors.orange,
              child: Image(
                image: AssetImage('asset/mujdome.jpeg'),
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Divider(
                thickness: 2,
                color: Colors.orange,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                top: 20,
                bottom: 20
              ),
              child: InkWell(
                child: Text('Profile',maxLines: 2, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ProfileScreen()));
                },
              ),
            ),
            _divider(),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                top: 20,
                bottom: 20
              ),
              child: InkWell(
                child: Text('HoD Edit Section', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                onTap: () {
                  print('presssed');
                   Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => HodSection()));
                },
              ),
            ),
            _divider(),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                top: 20,
                bottom: 20
              ),
              child: InkWell(
                child: Text('Search',maxLines: 2, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => SearchFaculty()));},
              ),
            ),
            _divider(),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                top: 20,
                bottom: 20
              ),
              child: InkWell(
                child: Text('Contact',maxLines: 2, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                onTap: () {},
              ),
            ),
            _divider(),
             Padding(
              padding: const EdgeInsets.only(
                left: 10,
                top: 20,
                bottom: 20
              ),
              child: InkWell(
                child: Text('Rate Us',maxLines: 2, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                onTap: () {},
              ),
            ),
            _divider(),
             Padding(
              padding: const EdgeInsets.only(
                left: 10,
                top: 20,
                bottom: 20
              ),
              child: InkWell(
                child: Text('Log Out',maxLines: 2, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600 ),),
                onTap: () async{
                  final _prefs = await SharedPreferences.getInstance();
                  _prefs.clear().then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => LoginScreen())));
                },
              ),
            ),
            
            
            _divider(),
            // Padding(
            //   padding: const EdgeInsets.only(
            //     left: 10,
            //   ),
            //   child: InkWell(
            //     child: Text('Placement Info'),
            //     onTap: () {},
            //   ),
            // ),
            // _divider(),
            // Padding(
            //   padding: const EdgeInsets.only(
            //     left: 10,
            //   ),
            //   child: InkWell(
            //     child: Text('Research Info'),
            //     onTap: () {},
            //   ),
            // ),
            // _divider(),
            // Padding(
            //   padding: const EdgeInsets.only(
            //     left: 10,
            //   ),
            //   child: InkWell(
            //     child: Text('Awards & Recognition Info'),
            //     onTap: () {},
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 10),
            //   child: Divider(
            //     thickness: 2,
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(
            //     left: 10,
            //   ),
            //   child: InkWell(
            //     child: Text('Functional Units Info'),
            //     onTap: () {},
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 10),
            //   child: Divider(
            //     thickness: 2,
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(
            //     left: 10,
            //   ),
            //   child: InkWell(
            //     child: Text('Program Info'),
            //     onTap: () {},
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 10),
            //   child: Divider(
            //     thickness: 2,
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(
            //     left: 10,
            //   ),
            //   child: InkWell(
            //     child: Text('Statutory Meeting Info'),
            //     onTap: () {},
            //   ),
            // ),
            // _divider(),
            // Container(
            //   padding: const EdgeInsets.symmetric(horizontal: 10),
            //   child: Image(
            //     width: wt * 0.5,
            //     height: ht * 0.075,
            //     image: AssetImage('asset/mujbanner.png'),
            //     fit: BoxFit.fill,
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  Widget _divider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Divider(
        thickness: 2,
      ),
    );
  }

  // Widget _buildRow( String title) {
  //   final TextStyle tStyle = TextStyle(color: Colors.black54, fontSize: 15.0);
  //   return Padding(
  //     padding: const EdgeInsets.only(left: 12),
  //     child: Container(
  //       padding: const EdgeInsets.symmetric(vertical: 8.0),
  //       child: Row(children: [
  //         Icon(
  //           icon,
  //           color: Colors.black54,
  //         ),
  //         SizedBox(width: 10.0),
  //         Text(
  //           title,
  //           style: tStyle,
  //         ),
  //       ]),
  //     ),
  //   );
  // }
}
