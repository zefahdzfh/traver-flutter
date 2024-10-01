// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_is_empty, prefer_const_literals_to_create_immutables, avoid_print, sort_child_properties_last, unused_local_variable, file_names

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:travel_app/ui/bookingPage.dart';
import 'package:travel_app/ui/favouritePage.dart';
import 'package:travel_app/ui/homePage.dart';
import 'package:travel_app/ui/profilePage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int menu = 0;
  List lsMenu = [HomePage(), BookingPage(), FavouritePage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: lsMenu[menu],
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: GNav(
            tabBackgroundColor: Colors.black,
            activeColor: Colors.white,
            padding: EdgeInsets.all(10),
            gap: 8,
            onTabChange: (value) {
              setState(() {
                menu = value;
              });
            },
            tabs: [
              GButton(icon: Icons.home, text: "Home"),
              GButton(icon: Icons.near_me, text: "Booking"),
              GButton(icon: Icons.favorite, text: "Favorit"),
              GButton(icon: Icons.person, text: "Profile"),
            ]),
      ),
    );
  }
}