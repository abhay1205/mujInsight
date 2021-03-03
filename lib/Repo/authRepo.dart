import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:mujinsight/utils/hosting.dart';

class AuthRepo{

  String email, password;

  AuthRepo({
    @required this.email,
    @required this.password
  });

  Future<http.Response> auth()async{
    try {
      http.Response response = await http.post(
      apihost+'auth/userLogin',
      body: jsonEncode({
        'email': this.email,
        'password': this.password
      }),
      headers: {
        "Content-Type":"application/json"
      }
    );
    print(response.body);
    return response;
    } catch (e) {
      print(e);
    }
  }
}