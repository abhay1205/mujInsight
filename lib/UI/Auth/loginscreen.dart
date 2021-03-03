import 'package:flutter/material.dart';
import 'package:mujinsight/Repo/authRepo.dart';
import 'package:mujinsight/UI/Auth/animBtn.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController userName = TextEditingController();
  TextEditingController pass = TextEditingController();
  GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  void initState() {
    // TODO: implement initState
    // _userName = TextEditingController();
    // _pass = TextEditingController();
    _scaffoldKey = GlobalKey<ScaffoldState>();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // _userName.dispose();
    // _pass.dispose();
    super.dispose();
  }  
  @override
  Widget build(BuildContext context) {
    double ht = MediaQuery.of(context).size.height;
    double wt = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.white,
                      Colors.orange[200],
                      Colors.orange[300],
                      Colors.orange[400]
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.09, 0.4, 0.6, 0.9])),
            margin: EdgeInsets.fromLTRB(0, ht * 0.01, 0, 0),
            padding: EdgeInsets.fromLTRB(0, ht * 0.01, 0, 0),
            height: ht,
            child:
                SingleChildScrollView(
              child: Column(
                children: [
                  loginCard(ht, wt),
                ],
              ),
            )),
        
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

  Widget wlecomeBanner(double ht, double wt) {
    return Container(
      child: Image(
        width: wt,
        height: ht * 0.2,
        image: AssetImage('asset/mujdome_art.jpeg'),
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Widget loginCard(double ht, double wt) {
    return Container(
      height: ht * 0.95,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: 'Welcome to \n',
                      style: TextStyle(
                          fontFamily: 'Playfair',
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Colors.black54)),
                  TextSpan(
                      text: 'MUJ Insights\n\n',
                      style: TextStyle(
                        fontFamily: 'Playfair',
                        fontSize: 35,
                        fontWeight: FontWeight.w600,
                        color: Colors.orange,
                      )),
                ]),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            wlecomeBanner(ht, wt),
            SizedBox(
              height: 60,
            ),
            inputFields()
            
          ],
        ),
      ),
    );
  }

  Widget inputFields() {
    return Container(
      child: Theme(
        data: ThemeData(
            primaryColor: Colors.white,
            textTheme: TextTheme(bodyText1: TextStyle(letterSpacing: 1))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: 
                  
                  Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.black54,
                      controller: userName,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.mail_outline, color: Colors.black54,),
                        filled: true,
                        fillColor: Colors.white,
                        hintStyle:
                            TextStyle(color: Colors.grey[600], fontSize: 20),
                        hintText: 'Official ID',
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ),
                
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: 
                  Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: TextField(
                      obscureText: true,
                      keyboardType: TextInputType.name,
                      cursorColor: Colors.black54,
                      controller: pass,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline, color: Colors.black54,),
                        filled: true,
                        fillColor: Colors.white,
                        hintStyle:
                            TextStyle(color: Colors.grey[600], fontSize: 20),
                        hintText: 'Password',
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ),
               
            ),
            SizedBox(height: 40,),
            AnimBtn(email: userName.text, password: pass.value.text, scaffoldKey: _scaffoldKey,),
            // Container(

            //   height: 55,
            //   width: MediaQuery.of(context).size.width * 0.9,
            //   child: RaisedButton(
            //     splashColor: Colors.orange,
            //     animationDuration: Duration(seconds: 1),
            //     onPressed: ()async{
                   
                     
            //       if(_userName.text!=null && _pass.text!=null){
            //         await AuthRepo(email: _userName.text, password: _pass.text).auth().then((value){
            //           if(value.statusCode==200){
            //             print(value.body);
            //            Navigator.of(context).pushReplacementNamed('/home');
            //           }
            //           else{
            //              print(value.body);
            //             _scaffoldKey.currentState.showSnackBar(SnackBar(
            //               shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
            //               content: Text('Something went wrong, Please Try again', style: TextStyle(color: Colors.white),),
            //              backgroundColor: Colors.orange,
            //              duration: Duration(seconds: 5),
            //              elevation: 5,));
            //           }
            //         });
            //       }
                 
            //     },
            //     child: Container(
            //       alignment: Alignment.center,
            //       child: Text('Log In',  style: TextStyle(color: Colors.black54, fontSize: 20),)),
            //     color: Colors.white,
            //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
