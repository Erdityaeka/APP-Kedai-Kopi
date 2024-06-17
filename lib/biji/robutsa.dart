import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kedakopi/nav.dart';

class ROBUTSA extends StatelessWidget {
  const ROBUTSA({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //tumpukan foto dan container dan jenis kopi
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: height * 0.3,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/Robutsa.jpg"),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TombolNav(),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    // ignore: sort_child_properties_last
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        "Biji Kopi Robutsa",
                        style: GoogleFonts.montserrat(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    height: height * .07,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                  )
                ],
              ),
              //row untuk rating dan asal
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "4.5 (30 review)",
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.location_city,
                              color: Colors.black,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Kongo-Belgia",
                              style: GoogleFonts.montserrat(
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const title_asal(
                title: "Asal",
                detail:
                    "Biji kopi Robutsa ini yaitu \nbiji kopi impor yang berasal di daerah Kongo Belgia",
              ),
              //deskription
              const title_asal(
                title: "Deskripsi",
                detail:
                    "Kopi Robusta pertama kali ditemukan di Kongo, Afrika Tengah pada akhir abad ke-19. Kopi ini kemudian menyebar ke seluruh dunia dan menjadi populer di Asia Tenggara, khususnya Indonesia, Vietnam, dan Brasil. Di Indonesia, kopi Robusta mulai ditanam pada awal abad ke-20 oleh pemerintah kolonial Belanda.",
              ),
              const title_asal(
                  title: "Manfaat",
                  detail:
                      "Manfaat kopi Arabika untuk kesehatan sebagai berikut.\n 1.Menjaga Kesehatan Jantung: Kopi Robusta mengandung antioksidan yang dapat membantu menjaga kesehatan jantung dan mencegah penyakit kardiovaskular.\n2.Meningkatkan Konsentrasi dan Energi: Kandungan kafein dalam kopi Robusta dapat membantu meningkatkan konsentrasi dan memberikan energi tambahan yang dibutuhkan oleh tubuh untuk beraktivitas sehari-hari.\n3.Meningkatkan Metabolisme: Kopi Robusta juga dapat membantu meningkatkan metabolisme tubuh dan membakar lemak."),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class title_asal extends StatelessWidget {
  final String title;
  final String detail;
  const title_asal({super.key, required this.title, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.montserrat(
              fontSize: 17,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            detail,
            style: GoogleFonts.montserrat(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
