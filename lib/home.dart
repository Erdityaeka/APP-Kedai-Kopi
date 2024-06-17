import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kedakopi/biji/Luwak.dart';
import 'package:kedakopi/biji/arabika.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:kedakopi/biji/robutsa.dart';

class HalamanHome extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const HalamanHome({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 221,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  viewportFraction: 1,
                ),
                items: [
                  "assets/kopi1.jpg",
                  "assets/kopi2.jpg",
                  "assets/kopi3.jpg",
                ].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: double.infinity,
                        height: 221,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(i),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Biji Kopi Favorite ☕",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: SizedBox(
                  width: 420,
                  height: 250,
                  child: Stack(
                    children: [
                      Card(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 10,
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: 170,
                              child: Image.asset(
                                "assets/Arabika.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 10,
                        child: SizedBox(
                          height: 80,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const KopiArabika(),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 0),
                                  child: Text(
                                    "Biji Kopi Arabika",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              const Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 12),
                                    child:
                                        Icon(Icons.star, color: Colors.amber),
                                  ),
                                  SizedBox(width: 10),
                                  Text("4.9"),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Icon(
                                    Icons.location_city_outlined  ,
                                    color: Colors.black,
                                  ),
                                  SizedBox(width: 10),
                                  Text('Etiopia')
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: 420,
                  height: 250,
                  child: Stack(
                    children: [
                      Card(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 10,
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: 170,
                              child: Image.asset(
                                "assets/Robutsa.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 10,
                        child: SizedBox(
                          height: 80,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const ROBUTSA(),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 0),
                                  child: Text(
                                    "Biji Kopi Robutsa",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              const Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 12),
                                    child:
                                        Icon(Icons.star, color: Colors.amber),
                                  ),
                                  SizedBox(width: 10),
                                  Text("4.5"),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Icon(
                                    Icons.location_city,
                                    color: Colors.black,
                                  ),
                                  SizedBox(width: 10),
                                  Text('Kongo-Belgia'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: 420,
                  height: 250,
                  child: Stack(
                    children: [
                      Card(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 10,
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: 170,
                              child: Image.asset(
                                "assets/luwak.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 10,
                        child: SizedBox(
                          height: 80,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Luwakk(),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 0),
                                  child: Text(
                                    "Biji Kopi Luwak",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              const Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 12),
                                    child:
                                        Icon(Icons.star, color: Colors.amber),
                                  ),
                                  SizedBox(width: 10),
                                  Text("4.3"),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Icon(
                                    Icons.location_city,
                                    color: Colors.black,
                                  ),
                                  SizedBox(width: 10),
                                  Text('Jawa-Indonesia')
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
