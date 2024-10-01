// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/ui/detail.dart';
import 'package:travel_app/ui/forgotpw.dart';
import 'package:travel_app/ui/home.dart';
import 'package:travel_app/ui/homePage.dart';
import 'package:travel_app/ui/introduction.dart';
import 'package:travel_app/ui/login.dart';
import 'package:travel_app/ui/register.dart';
import 'package:travel_app/ui/splashscreen.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? intro = false;
  String? isLogin = '';

  cekData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      if (prefs.getBool('isIntro') != null) {
        intro = prefs.getBool('isIntro');
      }
      if (prefs.getString('isLogin') != null) {
        isLogin = prefs.getString('isLogin');
      }
    });
  }

  @override
  void initState() {
    cekData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(Duration(seconds: 3)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              initialRoute: intro == null || intro == false
                  ? '/intro'
                  : isLogin == null || isLogin == false
                      ? '/login'
                      : '/',
              routes: {
                '/': (context) => Home(),
                '/splash': (context) => SplashScreen(),
                '/intro': (context) => Introduction(),
                '/login': (context) => Login(),
                '/register': (context) => Register(),
                '/forgotPage': (context) => Forgot(),
                '/detail': (context) => Detail()
              },
            );
          }

          return SplashScreen();
        });
  }
}
