import 'package:flutter/material.dart';
import 'package:mujinsight/UI/FacultyInfo/facultyInfo.dart';
import 'package:mujinsight/UI/Widgets/drawer.dart';
import 'package:emojis/emojis.dart'; // to use Emoji collection
import 'package:emojis/emoji.dart';

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  WhyFarther _selection;
  @override
  Widget build(BuildContext context) {
    double ht = MediaQuery.of(context).size.height;
    double wt = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      drawer: HDrawer(),
      body: Container(
        decoration: BoxDecoration(
            // image: DecorationImage(
            //     colorFilter: new ColorFilter.mode(
            //         Colors.black.withOpacity(0.3), BlendMode.dstATop),
            //     fit: BoxFit.fitWidth,
            //     image: AssetImage('asset/mujIcon.jpeg')),
            gradient: LinearGradient(
                colors: [Colors.white, Colors.grey[100]],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0.2, 0.8])),
        margin: EdgeInsets.fromLTRB(wt * 0.01, ht * 0.01, wt * 0.01, 0),
        padding: EdgeInsets.fromLTRB(wt * 0.02, ht * 0.03, wt * 0.02, 0),
        height: ht,
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        border: Border.all(color: Colors.white, width: 3),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(blurRadius: 2, color: Colors.grey[600])
                        ]),
                    child: IconButton(
                      icon: Icon(
                        Icons.sort,
                        color: Colors.black87,
                      ),
                      onPressed: () {
                        _scaffoldKey.currentState.openDrawer();
                      },
                    ),
                  ),
                  Text(
                    'MUJ Insights',
                    style: TextStyle(
                        fontFamily: 'Playfair',
                        fontSize: ht * 0.03,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87),
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          border: Border.all(color: Colors.white, width: 3),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(blurRadius: 2, color: Colors.grey[600])
                          ]),
                      child: profileMenuBtn())
                ],
              ),
            ),
            // introLine(ht, wt),
            menuGrid(ht, wt),
            bottomBanner(ht, wt)
          ],
        ),
      ),
    );
  }

  Widget bottomBanner(double ht, double wt) {
    return Container(
      child: Image(
        width: wt * 0.5,
        height: ht * 0.075,
        image: AssetImage('asset/mujbanner.png'),
        fit: BoxFit.fill,
      ),
    );
  }

  Widget introLine(double ht, double wt) {
    return Container(
      margin: EdgeInsets.only(top: ht * 0.05),
      padding: EdgeInsets.symmetric(horizontal: wt * 0.05),
      alignment: Alignment.topLeft,
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
              text: 'Welcome to\n',
              style: TextStyle(
                  fontSize: ht * 0.05,
                  letterSpacing: 1,
                  wordSpacing: 2,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600)),
          TextSpan(
              text: 'MUJ Insights',
              style: TextStyle(
                  fontSize: ht * 0.05,
                  letterSpacing: 1,
                  wordSpacing: 2,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600))
        ]),
      ),
    );
  }

  Widget profileMenuBtn() {
    return PopupMenuButton<WhyFarther>(
      icon: Icon(Icons.person_outline),
      onSelected: (WhyFarther result) {
        setState(() {
          _selection = result;
        });
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<WhyFarther>>[
        const PopupMenuItem<WhyFarther>(
          value: WhyFarther.harder,
          child: Text('Profile'),
        ),
        const PopupMenuItem<WhyFarther>(
          value: WhyFarther.smarter,
          child: Text('Log Out'),
        ),
        const PopupMenuItem<WhyFarther>(
          value: WhyFarther.selfStarter,
          child: Text('Help'),
        ),
        const PopupMenuItem<WhyFarther>(
          value: WhyFarther.tradingCharter,
          child: Text('Rate us'),
        ),
      ],
    );
  }

  Widget menuGrid(double ht, double wt) {
    return Container(
      margin: EdgeInsets.only(top: ht * 0.02),
      height: ht * 0.78,
      width: wt * 0.8,
      child: GridView.count(
        shrinkWrap: true,
        primary: false,
        padding: const EdgeInsets.all(5),
        crossAxisSpacing: 20,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => FacultyInfo())),
              child: menuCard(ht, wt, 'Faculty Information')),
          menuCard(ht, wt, 'Students Information'),
          menuCard(ht, wt, 'Placement Information'),
          menuCard(ht, wt, 'Research Information'),
          menuCard(ht, wt, 'Awards & Recognition Information'),
          menuCard(ht, wt, 'Funtional Units Information'),
          menuCard(ht, wt, 'Program Information'),
          menuCard(ht, wt, 'Statutory Meeting Information'),
        ],
      ),
    );
  }

  Widget menuCard(double ht, double wt, String name) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.white, width: 3),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(blurRadius: 2, color: Colors.grey)]),
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
              text: name,
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: ht * 0.025,
                  letterSpacing: 1,
                  wordSpacing: 2,
                  color: Colors.black54,
                  fontWeight: FontWeight.w600)),
        ]),
      ),
    );
  }
}
