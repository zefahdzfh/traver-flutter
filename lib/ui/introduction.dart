// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, use_build_context_synchronously, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Introduction extends StatefulWidget {
  const Introduction({super.key});

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  SaveAction()async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isIntro', true);
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
                title: "",
                bodyWidget: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Image.asset("assets/img/white-traver.png",
                            height: 50),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text(
                          "Lets explore the world",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 55,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  height: 1.2)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Text(
                          "Lets explore the world with just \na few clicks",
                          style: GoogleFonts.poppins(
                              textStyle:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
                image: Stack(
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/img/page1.jpg"),
                              fit: BoxFit.cover),
                        )),
                    Container(
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.transparent, Colors.black54],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter))),
                  ],
                ),
                decoration: PageDecoration(
                    fullScreen: true,
                    titlePadding: EdgeInsets.only(bottom: 0),
                    bodyFlex: 1)),
            PageViewModel(
                title: "",
                bodyWidget: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Image.asset("assets/img/white-traver.png",
                            height: 50),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text(
                          "Visit tourist attractions",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 55,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  height: 1.2)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Text(
                          "Find thousands of tourist destinations ready for you visit",
                          style: GoogleFonts.poppins(
                              textStyle:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
                image: Stack(
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/img/page2.jpg"),
                              fit: BoxFit.cover),
                        )),
                    Container(
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.transparent, Colors.black54],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter))),
                  ],
                ),
                decoration: PageDecoration(
                    fullScreen: true,
                    titlePadding: EdgeInsets.only(bottom: 0),
                    bodyFlex: 1)),
            PageViewModel(
                title: "",
                bodyWidget: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Image.asset("assets/img/white-traver.png",
                            height: 50),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text(
                          "Get ready for next trip",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 55,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  height: 1.2)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Text(
                          "Let your adventure starts today only with us",
                          style: GoogleFonts.poppins(
                              textStyle:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
                image: Stack(
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/img/page3.jpg"),
                              fit: BoxFit.cover),
                        )),
                    Container(
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.transparent, Colors.black54],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter))),
                  ],
                ),
                decoration: PageDecoration(
                    fullScreen: true,
                    titlePadding: EdgeInsets.only(bottom: 0),
                    bodyFlex: 1)),
          ],
          showSkipButton: true,
          skip: const Text("Skip", style: TextStyle(color: Colors.white)),
          next: const Text("Next", style: TextStyle(color: Colors.white)),
          done: const Text("Done",
              style:
                  TextStyle(fontWeight: FontWeight.w700, color: Colors.white)),
          onDone: () => SaveAction(),
          onSkip: () => SaveAction(),
          dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(50.0, 10.0),
            activeColor: const Color.fromARGB(255, 224, 214, 214),
            color: Colors.white,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
          ),
        ),
      ),
    );
  }
}