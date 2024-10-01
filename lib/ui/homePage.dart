// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_is_empty, prefer_const_literals_to_create_immutables, avoid_print, sort_child_properties_last, unused_local_variable, file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:travel_app/controller/homeController.dart';
import 'package:travel_app/model/model.dart';
import 'package:travel_app/widget/judul.dart';
import 'package:travel_app/widget/kategori.dart';
import 'package:travel_app/widget/popular.dart';
import 'package:travel_app/widget/wisata.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String nama = "Fulan";

  @override
  void initState() {
    HomeController().getName().then((value) {
      setState(() {
        nama = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var tinggi = MediaQuery.of(context).size.height;
    var lebar = MediaQuery.of(context).size.width;
    return Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //Start hello
          Container(
            margin: EdgeInsets.only(bottom: tinggi * 0.03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 252, 211, 64),
                        child: Icon(Icons.person),
                      ),
                    ),
                    Text("Hello, $nama",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500)))
                  ],
                ),
                Icon(Icons.notifications)
              ],
            ),
          ),
          //end hello

          //start explore
          Container(
            margin: EdgeInsets.only(bottom: tinggi * 0.03),
            child: Text("Where do you want to explore today?",
                style: GoogleFonts.poppins(
                    textStyle:
                        TextStyle(fontSize: 37, fontWeight: FontWeight.w700))),
          ),
          //end explore

          //start search
          Container(
            margin: EdgeInsets.only(bottom: tinggi * 0.03),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Search destination",
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  hintStyle: GoogleFonts.poppins(fontSize: 20)),
            ),
          ),
//end search
//start category
          //start category
          Judul("Choose Category", "See All", tinggi),
          FutureBuilder(
            future: HomeController().getKategori(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                List<DataKategori> data = snapshot.data;

                return Container(
                    margin: EdgeInsets.only(bottom: tinggi * 0.03),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Wrap(
                          spacing: 20,
                          children: List.generate(data.length, (index) {
                            return Category(data[index].namaKategori,
                                data[index].gambarKategori, lebar);
                          })),
                    ));
              } else {
                return Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                        margin: EdgeInsets.only(bottom: tinggi * 0.03),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Wrap(
                              spacing: 20,
                              children: List.generate(3, (index) {
                                return Category(
                                    "Category",
                                    "https://i.ibb.co/vPnDfxZ/play-circle.png",
                                    lebar);
                              })),
                        )));
              }
            },
          ),
//end category

//start favorit
          Judul("Favorite Place", "Explore", tinggi),
          // Container(
          //     margin: EdgeInsets.only(bottom: tinggi * 0.03),
          //     child: SingleChildScrollView(
          //         scrollDirection: Axis.horizontal,
          //         child: Wrap(spacing: 20, children: [

          //         ]))),
          FutureBuilder(
            future: HomeController().getFavorit(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                List<DataWisata> data = snapshot.data;

                return Container(
                    margin: EdgeInsets.only(bottom: tinggi * 0.03),
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Wrap(
                            spacing: 20,
                            children: List.generate(data.length, (index) {
                              return InkWell(
                                onTap: () => Navigator.pushNamed(context, '/detail',arguments: data[index]),
                                child: wisata(
                                    data[index].gambarWisata,
                                    data[index].namaWisata,
                                    data[index].lokasiWisata,
                                    data[index].ratingWisata.toString(),
                                    tinggi,
                                    lebar,
                                    context),
                              );
                            }))));
              } else {
                return Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                        margin: EdgeInsets.only(bottom: tinggi * 0.03),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Wrap(
                              spacing: 20,
                              children: List.generate(3, (index) {
                                return Category(
                                    "Category",
                                    "https://i.ibb.co/vPnDfxZ/play-circle.png",
                                    lebar);
                              })),
                        )));
              }
            },
          ),
//end favorit

//start popular
          // Judul("Popular Package", "See All", tinggi),
          // Container(
          //   margin: EdgeInsets.only(bottom: tinggi * 0.03),
          //   child: Wrap(
          //     runSpacing: 30,
          //     children: [
          //       Popular(
          //           "assets/img/page1.jpg",
          //           "Tempat Wisata",
          //           "500000",
          //           4.8,
          //           "Lorem ipsum dolor sit amet consectetur adipisicing elit...",
          //           lebar,
          //           tinggi),
          //       Popular(
          //           "assets/img/page2.jpg",
          //           "Tempat Wisata",
          //           "300000",
          //           4.8,
          //           "Lorem ipsum dolor sit amet consectetur adipisicing elit...",
          //           lebar,
          //           tinggi),
          //       Popular(
          //           "assets/img/page3.jpg",
          //           "Tempat Wisata",
          //           "800000",
          //           4.8,
          //           "Lorem ipsum dolor sit amet consectetur adipisicing elit...",
          //           lebar,
          //           tinggi),
          //     ],
          //   ),
          // )
          //start category
          Judul("Popular Package", "See All", tinggi),
          FutureBuilder(
            future: HomeController().getPopular(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                List<DataWisata> data = snapshot.data;

                return Container(
                  margin: EdgeInsets.only(bottom: tinggi * 0.03),
                  child: Wrap(
                    runSpacing: 30,
                    children: [
                      Wrap(
                          spacing: 20,
                          children: List.generate(data.length, (index) {
                            return Popular(
                                data[index].gambarWisata,
                                data[index].namaWisata,
                                data[index].hargaWisata.toString(),
                                data[index].ratingWisata.toDouble(),
                                data[index].deskripsiWisata,
                                lebar,
                                tinggi);
                          })),
                    ],
                  ),
                );
              } else {
                return Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                        margin: EdgeInsets.only(bottom: tinggi * 0.03),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Wrap(
                              spacing: 20,
                              children: List.generate(3, (index) {
                                return Category(
                                    "Category",
                                    "https://i.ibb.co/vPnDfxZ/play-circle.png",
                                    lebar);
                              })),
                        )));
              }
            },
          ),
//end category
//end popular
        ])));
  }
}
