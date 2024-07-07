import 'dart:convert';

import 'package:memory/model/token/Token.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHelper {
  static const String USER_EMAIL = 'email';
  static const String USER_PWD = 'password';
  static const String USER_TOKEN = 'token';

  static const String AUTO_LOGIN = 'autoLogin';
  static const String USER_DEVICE_CODE = 'deviceCode';


  static Future<String> getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String tokenStr = prefs.getString(PreferenceHelper.USER_TOKEN)??'';
    if (tokenStr.isEmpty) {
      return '';
    }
    Token token = Token.fromJson(jsonDecode(tokenStr));
    String accessToken = token.accessToken;
    return accessToken;
  }
}
