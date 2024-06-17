import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kedakopi/nav.dart';

class KopiArabika extends StatelessWidget {
  const KopiArabika({super.key});

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
                        image: AssetImage("assets/Arabika.jpg"),
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
                              builder: (context) =>  TombolNav(),
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
                        "Biji Kopi Arabika",
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
                          "4.9 (35 review)",
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
                              "Etiopia",
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
                    "Biji kopi arabika ini yaitu biji kopi impor yang berasal di Etiopia.",
              ),
              //deskription
              const title_asal(
                title: "Deskripsi",
                detail:
                    "Kopi Arabika berasal dari Ethiopia, di wilayah Kaffa dengan nama latin coffea arabica, di mana ditemukan tumbuh liar pada sekitar abad ke-15. Dari sana, tumbuhan ini menyebar ke seluruh dunia Arab melalui Yaman.\nBaru pada paruh kedua sekitar abad ke-17, ketika keinginan untuk minum kopi juga menguasai Eropa Barat, tanaman kopi mulai bermigrasi, mengakhiri monopoli Arab dalam penanaman pohon kopi.\nDengan demikian, budidaya tanaman kopi menyebar ke India (Malabar), Jawa bahkan sampai ke benua Amerika. Sampai hari ini, kopi Arabika atau adalah varietas yang paling luas.",
              ),
              const title_asal(
                  title: "Manfaat",
                  detail:
                      "Manfaat kopi Arabika untuk kesehatan sebagai berikut.\n 1.Menjaga Stamina Tubuh\nDalam kopi Arabika ini mengandung kafein tinggi yang sangat ampuh untuk menjaga kesehatan tubuh sekaligus memberikan stamina. Kafein merupakan sumber energi untuk otak sehingga bisa memerintahkan seluruh tubuh untuk tetap bekerja dengan baik seperti seharusnya.\n2.Menjaga Kesehatan Mulut\nManfaat minum kopi hitam khususnya Arabika adalah sangat baik untuk menjaga kesehatan mulut. Minum kopi ini secara teratur akan menurunkan risiko beberapa masalah mulut seperti radang gusi, plak, masalah gigi bahkan kanker mulut. Namun pastikan untuk mengkonsumsi kopi ini tanpa tambahan gula agar tidak menyebabkan infeksi gigi dan berbagai masalah lainnya.\n3.Mencegah Kanker\nKopi Arabika juga menjadi minuman solusi kanker karena mengandung antioksidan tinggi yang efektif dalam melawan sel kanker dalam tubuh. Manfaat antioksidan tidak hanya baik untuk regenerasi sel, namun juga menyeimbangkan nutrisi dalam darah sehingga bisa melindungi tubuh dari sel kanker dengan cara minum kopi Arabika 2 cangkir sehari."),
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
