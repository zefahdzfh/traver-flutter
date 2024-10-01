// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_is_empty, prefer_const_literals_to_create_immutables, avoid_print, sort_child_properties_last, unused_local_variable, file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget Popular(String img, String name, String price, double rating,
    String desc, lebar, tinggi) {
  return Container(
    width: lebar,
    height: tinggi * 0.25,
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(255, 205, 202, 202)),
        borderRadius: BorderRadius.circular(20)),
    child: Row(
      children: [
        Container(
          width: lebar * 0.3,
          height: tinggi,
          margin: EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(img), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(20)),
        ),
        Container(
          width: lebar * 0.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(name,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600))),
                    Icon(Icons.favorite_border,
                        color: Color.fromARGB(255, 205, 202, 202))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Text("Rp. ${price}",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: Colors.red))),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Wrap(
                  spacing: 5,
                  children: [
                    Icon(Icons.star,
                        color: Color.fromARGB(255, 252, 210, 64), size: 20),
                    Icon(Icons.star,
                        color: Color.fromARGB(255, 252, 210, 64), size: 20),
                    Icon(Icons.star,
                        color: Color.fromARGB(255, 252, 210, 64), size: 20),
                    Icon(Icons.star,
                        color: Color.fromARGB(255, 252, 210, 64), size: 20),
                    Icon(Icons.star,
                        color: Color.fromARGB(255, 205, 202, 202), size: 20),
                    Text(rating.toString(),
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        )))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Text(desc,
                    style: GoogleFonts.poppins(
                        textStyle: 
                        TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),),maxLines: 2,),
              )
            ],
          ),
        )
      ],
    ),
  );
}
