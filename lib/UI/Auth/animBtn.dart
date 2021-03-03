import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:mujinsight/Repo/authRepo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AnimBtn extends StatefulWidget {
  final String email, password;
  GlobalKey<ScaffoldState> scaffoldKey;
  AnimBtn({this.email, this.password, this.scaffoldKey});
  @override
  _AnimBtnState createState() => _AnimBtnState();
}

class _AnimBtnState extends State<AnimBtn> with TickerProviderStateMixin {
  int _state = 0;
  Animation _animation;
  AnimationController _controller;
  GlobalKey _globalKey = GlobalKey();
  double _width = double.maxFinite;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // widget.scaffoldKey = GlobalKey<ScaffoldState>();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        child: Align(
          alignment: Alignment.center,
          child: PhysicalModel(
            elevation: 8,
            shadowColor: Colors.white,
            color: Colors.orange,
            borderRadius: BorderRadius.circular(25),
            child: Container(
              key: _globalKey,
              height: 50,
              width: _width,
              child: RaisedButton(
                animationDuration: Duration(milliseconds: 1000),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.all(0),
                child: setUpButtonChild(),
                onPressed: () {
                  if (widget.email != "" && widget.password != "") {
                    print("Password" + widget.password);
                    setState(() {
                      if (_state == 0) {
                        animateButton();
                      }
                    });
                    login();
                  } else {
                    widget.scaffoldKey.currentState.showSnackBar(SnackBar(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      content: Text(
                        'Empty fields not allowed',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.orange,
                      duration: Duration(seconds: 5),
                      elevation: 5,
                    ));
                  }
                },
                elevation: 4,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  setUpButtonChild() {
    if (_state == 0) {
      return Text(
        "Log In",
        style: const TextStyle(
          color: Colors.black54,
          fontSize: 20,
        ),
      );
    } else if (_state == 1) {
      return SizedBox(
        height: 36,
        width: 36,
        child: CircularProgressIndicator(
          value: null,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
        ),
      );
    } else {
      return Icon(Icons.check, color: Colors.orange);
    }
  }

  void animateButton() {
    double initialWidth = _globalKey.currentContext.size.width;

    _controller =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);

    _animation = Tween(begin: 0.0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {
          _width = initialWidth - ((initialWidth - 48) * _animation.value);
        });
      });
    _controller.forward();

    setState(() {
      _state = 1;
    });
  }

  void login() async {
    await AuthRepo(email: widget.email, password: widget.password)
        .auth()
        .then((value) async {
      if (value.statusCode == 200) {
        setState(() {
          _state = 2;
        });
        print(value.body);
        final _prefs = await SharedPreferences.getInstance();
        _prefs.setString('userID', jsonDecode(value.body)['id']).then((done1) => _prefs.setString('jwt', jsonDecode(value.body)['token']).then((done2) =>
            _prefs.setString('access', jsonDecode(value.body)['access']).then(
                (value) =>
                    Navigator.of(context).pushReplacementNamed('/home'))));
        ;
      } else {
        deAnimate();
        print(value.body);
        widget.scaffoldKey.currentState.showSnackBar(SnackBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          content: Text(
            'Something went wrong, Please Try again',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.orange,
          duration: Duration(seconds: 5),
          elevation: 5,
        ));
      }
    });
  }

  void deAnimate() {
    double initialWidth = _globalKey.currentContext.size.width;

    _controller =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);

    _animation = Tween(begin: 0.0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {
          _width = initialWidth + ((initialWidth + 88) * _animation.value);
        });
      });
    _controller.forward();

    setState(() {
      _state = 0;
    });
  }
}
