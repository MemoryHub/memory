import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:memory/model/token/Token.dart';
import 'package:memory/pages/home/home_page.dart';
import 'package:memory/utils/api_config.dart';
import 'package:memory/utils/http_util.dart';
import 'package:memory/utils/preference_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  _login(BuildContext context, LoginData data) async {
    Map<String, String> param = {
      'email': data.name,
      'password': data.password,
    };
    HttpUtil http = new HttpUtil(APIConfig.LOGIN, param);
    dynamic map = await http.getResponseMap(HttpType.POST);
    await _dealLogin(context, http, map);
  }

  _dealLogin(BuildContext context, HttpUtil http, map) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    Token token = Token(
      map['accessToken'],
      map['name'],
      map['isAdmin'],
      map['userId'],
      map['userEmail'],
      map['profileImagePath'],
      map['shouldChangePassword'],
    );
    // 将Token对象转换为JSON字符串并存储
    String tokenJson = jsonEncode(token.toJson());
    pref.setString(PreferenceHelper.USER_TOKEN, tokenJson);

    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => HomePage(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FlutterLogin(
        onLogin: (LoginData data) {
          _login(context, data);
        },
        onRecoverPassword: (String) {},
        // onSubmitAnimationCompleted: () {
        //   // Navigator.of(context).pushReplacement(MaterialPageRoute(
        //   //   builder: (context) => HomePage(),
        //   // ));
        // },
      ),
    );
  }
}
