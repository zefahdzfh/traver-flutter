// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.9,
                child: Center(child: Image.asset("assets/img/traver.png"))),
            Center(
              child: Text("Version 1.1.0"),
            )
          ],
        ),
      ),
    );
  }
}