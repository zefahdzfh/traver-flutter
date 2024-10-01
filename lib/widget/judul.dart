// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_is_empty, prefer_const_literals_to_create_immutables, avoid_print, sort_child_properties_last, unused_local_variable, file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget Judul(String judul, String sub, tinggi) {
  return Container(
    margin: EdgeInsets.only(bottom: tinggi * 0.02),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(judul,
            style: GoogleFonts.poppins(
                textStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.w600))),
        Text(sub,
            style: GoogleFonts.poppins(
                textStyle: TextStyle(fontSize: 18, color: Colors.grey)))
      ],
    ),
  );
}