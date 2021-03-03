import 'package:flutter/material.dart';
import 'package:mujinsight/UI/Auth/loginscreen.dart';
import 'package:mujinsight/UI/Home/homescreen.dart';
import 'package:mujinsight/utils/sharedPref.dart';

class LoggedInLogic extends StatefulWidget {
  @override
  _LoggedInLogicState createState() => _LoggedInLogicState();
}

class _LoggedInLogicState extends State<LoggedInLogic> {

  LocalRepo _localRepo = LocalRepo();
  bool loggedIn;
  
  Future getLoginStatus()async{
    String jwToken = await _localRepo.getJWT();

    if(jwToken!=null){
      setState(() {
        loggedIn = true;
      });
    }
    else{
      setState(() {
        loggedIn = false;
      });
    }
  }
  
  @override
  void initState() {
    getLoginStatus().then((value){
      if(loggedIn){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
      }else{
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
      }
    });
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
      ),
    );
  }
}