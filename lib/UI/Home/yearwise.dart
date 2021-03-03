import 'package:flutter/material.dart';
import 'package:mujinsight/UI/Widgets/backTopBar.dart';
import 'package:mujinsight/UI/Widgets/drawer.dart';

enum Profile { harder, smarter, selfStarter, tradingCharter }

class YearWiseScreen extends StatefulWidget {

  final section;
  YearWiseScreen(this.section);
  @override
  _YearWiseScreenState createState() => _YearWiseScreenState();
}

class _YearWiseScreenState extends State<YearWiseScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey;
  Profile _selection;

  // Map<String, Widget Function(BuildContext)> _navigation = {
    
  // } 


  @override
  void initState() {
    // TODO: implement initState
    _scaffoldKey = GlobalKey<ScaffoldState>();
    // _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Choose the year to see the details', style: TextStyle(color: Colors.white),), backgroundColor: Colors.orange,));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double ht = MediaQuery.of(context).size.height;
    double wt = MediaQuery.of(context).size.width;
    return SafeArea(
          child: Scaffold(
        key: _scaffoldKey,
        drawer: HDrawer(),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white
              // image: DecorationImage(
              //     colorFilter: new ColorFilter.mode(
              //         Colors.black.withOpacity(0.3), BlendMode.dstATop),
              //     fit: BoxFit.fitWidth,
              //     image: AssetImage('asset/mujIcon.jpeg')),
              // gradient: LinearGradient(
              //     colors: [Colors.white, Colors.grey[100]],
              //     begin: Alignment.bottomCenter,
              //     end: Alignment.topCenter,
              //     stops: [0.2, 0.8])
                  ),
          margin: EdgeInsets.fromLTRB(wt * 0.01, ht * 0.01, wt * 0.01, 0),
          padding: EdgeInsets.fromLTRB(wt * 0.02, ht * 0.01, wt * 0.02, 0),
          height: ht,
          child: ListView(
            shrinkWrap: true,
            children: [
              // Container(
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Container(
              //         decoration: BoxDecoration(
              //             color: Colors.orange,
              //             border: Border.all(color: Colors.white, width: 3),
              //             borderRadius: BorderRadius.circular(10),
              //             boxShadow: [
              //               BoxShadow(blurRadius: 2, color: Colors.grey[600])
              //             ]),
              //         child: IconButton(
              //           icon: Icon(
              //             Icons.sort,
              //             color: Colors.black87,
              //           ),
              //           onPressed: () {
              //             _scaffoldKey.currentState.openDrawer();
              //           },
              //         ),
              //       ),
              //       Text(
              //         'MUJ Insights',
              //         style: TextStyle(
              //             fontFamily: 'Playfair',
              //             fontSize: ht * 0.03,
              //             fontWeight: FontWeight.w600,
              //             color: Colors.black87),
              //       ),
              //       Container(
              //           decoration: BoxDecoration(
              //               color: Colors.orange,
              //               border: Border.all(color: Colors.white, width: 3),
              //               borderRadius: BorderRadius.circular(10),
              //               boxShadow: [
              //                 BoxShadow(blurRadius: 2, color: Colors.grey[600])
              //               ]),
              //           child: profileMenuBtn())
              //     ],
              //   ),
              // ),
              // introLine(ht, wt),
              BackTopBar(),
              SingleChildScrollView(
                child: Column(
                  children: [
                    menuGrid(ht, wt),
              // bottomBanner(ht, wt)
                  ],
                ),
              )
              
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.orange,
        label: Text('Leagcy', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
        onPressed: (){},
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
    return PopupMenuButton<Profile>(
      icon: Icon(Icons.person_outline),
      onSelected: (Profile result) {
        setState(() {
          _selection = result;
        });
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<Profile>>[
        const PopupMenuItem<Profile>(
          value: Profile.harder,
          child: Text('Profile'),
        ),
        const PopupMenuItem<Profile>(
          value: Profile.smarter,
          child: Text('Log Out'),
        ),
        const PopupMenuItem<Profile>(
          value: Profile.selfStarter,
          child: Text('Help'),
        ),
        const PopupMenuItem<Profile>(
          value: Profile.tradingCharter,
          child: Text('Rate us'),
        ),
      ],
    );
  }

  Widget menuGrid(double ht, double wt) {
    return Container(
      margin: EdgeInsets.only(top: ht * 0.02),
      height: ht * 0.8,
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
              onTap: () => Navigator.of(context).pushNamed('/${widget.section}'),
              child: menuCard(ht, wt, '2020')),
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed('/${widget.section}'),
            child: menuCard(ht, wt, '2019')),
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed('/${widget.section}'),
            child: menuCard(ht, wt, '2018')),
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed('/${widget.section}'),
            child: menuCard(ht, wt, '2017')),
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed('/${widget.section}'),
            child: menuCard(ht, wt, '2016')),
          
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed('/${widget.section}'),
            child: menuCard(ht, wt, '2015')),
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed('/${widget.section}'),
            child: menuCard(ht, wt, '2014')),
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed('/${widget.section}'),
            child: menuCard(ht, wt, '2013')),
            GestureDetector(
            onTap: () => Navigator.of(context).pushNamed('/${widget.section}'),
            child: menuCard(ht, wt, '2012')),
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
      child:
          Text(
               name,
              maxLines: 4,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 18,
                  letterSpacing: 1,
                  wordSpacing: 2,
                  color: Colors.black54,
                  fontWeight: FontWeight.w600)),
        
    );
  }
}
