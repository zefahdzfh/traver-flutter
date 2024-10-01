// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_is_empty, prefer_const_literals_to_create_immutables, avoid_print, sort_child_properties_last, unused_local_variable, file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget Category(String name, String img, lebar) {
  return Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20)),
    child: Row(
      children: [
        Container(
            margin: EdgeInsets.only(right: lebar * 0.01),
            child: Image.network(img)),
        Text(name,
            style: GoogleFonts.poppins(
                textStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.w600))),
      ],
    ),
  );
}