import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mujinsight/UI/Widgets/backTopBar.dart';
import 'package:mujinsight/UI/Widgets/drawer.dart';
import 'package:http/http.dart' as http;
import 'package:mujinsight/utils/hosting.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String name='', designation='', email='';
  
  Future<http.Response> getProfile()async{
    print('called');
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String uid = _prefs.getString('userID');
    String jwt = _prefs.getString('jwt');
    String url = apihost + 'auth/getUser?uid=$uid';
    try{
        http.Response response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $jwt'
    });
    if(response.statusCode==200){
      setState(() {
      var decodedResponse = json.decode(response.body)['data'];
      name = decodedResponse['name'];
      designation = decodedResponse['access'];
      email = decodedResponse['email'];
    });
    }
    else{
      print('Error');
    }
    }catch(e){
      print('Error');
    }
  
    
  }

  @override
  void initState() {
    getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double ht = MediaQuery.of(context).size.height;
    double wt = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: name!=''?
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.white, Colors.grey[50]],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          margin: EdgeInsets.fromLTRB(wt * 0.01, ht * 0.01, wt * 0.01, 0),
          padding: EdgeInsets.fromLTRB(wt * 0.02, ht * 0.01, wt * 0.02, 0),
          height: ht,
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(decoration: BoxDecoration(), child: BackTopBar()),
              SingleChildScrollView(
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          wt * 0.05, ht * 0.1, wt * 0.05, ht * 0.1),
                      height: ht * 0.6,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: ht * 0.2,
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.account_circle,
                              color: Colors.orange,
                              size: 30,
                            ),
                            title: Text('$name', style: TextStyle(fontSize: 20),),
                           
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.people,
                              color: Colors.orange,
                              size: 30,
                            ),
                            title: Text('$designation', style: TextStyle(fontSize: 20),),
                           
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.mail_outline,
                              color: Colors.orange,
                              size: 30,
                            ),
                            title: Text('$email'),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: wt * 0.32,
                      top: ht * 0.1,
                      child: CircleAvatar(
                        backgroundColor: Colors.orange,
                        maxRadius: 60,
                        minRadius: 30,
                        child: Text(
                          "MS",
                          style: TextStyle(fontSize: 40, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ):Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),),)
        ,
      ),
    );
  }
}
