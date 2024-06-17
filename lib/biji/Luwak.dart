import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kedakopi/nav.dart';

class Luwakk extends StatelessWidget {
  const Luwakk({super.key});

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
                        image: AssetImage("assets/luwak.jpg"),
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
                        "Biji Kopi Luwak",
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
                          "4.3 (25 review)",
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
                    "Biji kopi luwak ini yaitu biji kopi lokal yang berasal di jawa.",
              ),
              //deskription
              const title_asal(
                title: "Deskripsi",
                detail:
                    "Asal mula kopi Luwak terkait dengan sejarah pembudidayaan tanaman kopi di Indonesia. Pada awal abad ke-18, Belanda membuka perkebunan tanaman kopi komersial di koloninya di Hindia Belanda, terutama di pulau Jawa dan Sumatra. Salah satunya adalah perkebunan kopi Arabika dengan bibit yang didatangkan dari Yaman. Pada masa itu, pekerja perkebunan menemukan bahwa luwak gemar memakan buah kopi, tetapi hanya daging buahnya yang tercerna. Biji kopi dalam kotoran luwak ini kemudian dipunguti, dicuci, disangrai, dan diseduh dengan air panas, sehingga terciptalah kopi Luwak.",
              ),
              const title_asal(
                  title: "Manfaat",
                  detail:
                      "Manfaat kopi Arabika untuk kesehatan sebagai berikut.\n1.Aman untuk Pengidap Asam Lambung: Rasa kopi Luwak yang lebih lembut membuatnya lebih aman bagi penderita maag. Kandungan asam yang rendah mengurangi risiko gejala maag saat mengonsumsi kopi ini.\n2.Meningkatkan Kesehatan Kardiovaskular: Antioksidan dalam kopi Luwak dapat membantu melindungi kesehatan jantung dan pembuluh darah. Risiko penyakit seperti nyeri sendi dan kram dapat dicegah dengan mengonsumsi kopi Luwak secara rutin.\n3.Meningkatkan Kesehatan Jantung: Kopi Luwak melindungi otot jantung dari kerusakan arteri, membantu mencegah risiko penyakit jantung seperti hipertensi, penggumpalan darah, serangan jantung, dan gagal jantung."),
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
