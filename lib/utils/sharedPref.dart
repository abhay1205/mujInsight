import 'package:shared_preferences/shared_preferences.dart';

class LocalRepo{

  Future<String> getID()async{
    final _prefs = await SharedPreferences.getInstance();
    String jwt = _prefs.getString('userID');
    return jwt;
  }

  Future<String> getJWT()async{
    final _prefs = await SharedPreferences.getInstance();
    String jwt = _prefs.getString('jwt');
    return jwt;
  }
  Future<String> getAccess()async{
    final _prefs = await SharedPreferences.getInstance();
    String access = _prefs.getString('access');
    return access;
  }
}