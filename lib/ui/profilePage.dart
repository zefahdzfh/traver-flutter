// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_is_empty, prefer_const_literals_to_create_immutables, avoid_print, sort_child_properties_last, unused_local_variable, file_names


import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text("Profile Page"),
        )
      ],
    );
  }
}