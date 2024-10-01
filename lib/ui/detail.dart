// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_is_empty, prefer_const_literals_to_create_immutables, avoid_print, sort_child_properties_last, unused_local_variable, file_names, non_constant_identifier_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/model/model.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments
        as DataWisata; //mengambil data dari argumen
    var tinggi = MediaQuery.of(context).size.height;
    var lebar = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: tinggi,
            width: lebar,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(data.gambarWisata), fit: BoxFit.cover)),
          ),
          Container(
            height: tinggi,
            width: lebar,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black87],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            ),
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context) ,
                        child: CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 25,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Favorite Place',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.check_circle,
                            color: Colors.yellow,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.namaWisata,
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(right: 3),
                              child: Icon(Icons.place_outlined,
                                  color: Colors.white)),
                          Text(data.lokasiWisata,
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white)))
                        ],
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Text(data.deskripsiWisata,
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white))),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.yellow),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(data.ratingWisata.toString(),
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white)))
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.attach_money_rounded,
                                    color: Colors.white),
                                SizedBox(
                                  width: 10,
                                ),
                                Row(
                                  children: [
                                    Text(data.hargaWisata.toString(),
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w300,
                                                color: Colors.white))),
                                    SizedBox(width: 5),
                                    Text('/Person',
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w300,
                                                color: Colors.white))),
                                  ],
                                )
                              ],
                            ),
                            
                          ],
                        ),
                      ),
                      SizedBox(height: 24,),
                      ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white, backgroundColor: Colors.orange,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                minimumSize: Size(lebar - 32, 60),
                              ),
                              child: Text(
                                'Book Now !',
                                style: GoogleFonts.poppins(fontSize: 18),
                              ),
                            ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
