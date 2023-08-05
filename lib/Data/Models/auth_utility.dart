import 'dart:convert';

import 'package:m_11_addtask_project/Data/Models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthUtility{
  AuthUtility._();
  static LoginModel userinfo = LoginModel();

  static Future<void> saveUserInfo(LoginModel model) async{
    SharedPreferences _sharedprefs = await SharedPreferences.getInstance();
    await _sharedprefs.setString('user-data', jsonEncode(model.toJson()));
    userinfo= model;
  }

  static Future<LoginModel> getUserInfo() async{
    SharedPreferences _sharedprefs = await SharedPreferences.getInstance();
    String value = _sharedprefs.getString('user-data')!;
    return LoginModel.fromJson(jsonDecode(value));
  }

  static Future<void> clearUserInfo() async{
    SharedPreferences _sharedprefs = await SharedPreferences.getInstance();
    _sharedprefs.clear();
  }

  static Future<bool> checkifUserLoggedin() async{
    SharedPreferences _sharedprefs = await SharedPreferences.getInstance();
    bool isLoggedin = _sharedprefs.containsKey('user-data');
    if(isLoggedin){
      userinfo = await getUserInfo();
    }
    return isLoggedin;
  }
}