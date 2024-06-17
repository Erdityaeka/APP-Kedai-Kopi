import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Booking extends StatefulWidget {
  const Booking({Key? key}) : super(key: key);

  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  TextEditingController namaController = TextEditingController();
  TextEditingController nohpController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController mejaController = TextEditingController();

  Future<void> _launchWhatsApp(String phoneNumber, String message) async {
    final url = 'https://wa.me/$phoneNumber?text=${Uri.encodeFull(message)}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Pengisian Form Booking',
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 40),
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                            "Nama:  ",
                            style: GoogleFonts.montserrat(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: TextFormField(
                            controller: namaController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                            "No Hp:  ",
                            style: GoogleFonts.montserrat(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: TextFormField(
                            controller: nohpController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                            "Alamat:",
                            style: GoogleFonts.montserrat(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: TextFormField(
                            controller: alamatController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            "Meja:    ",
                            style: GoogleFonts.montserrat(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: TextFormField(
                            controller: mejaController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Meja untuk berapa orang?",
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Text(
                      "Informasi:",
                      style: GoogleFonts.montserrat(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Silahkan melakukan pemesanan terlebih dahulu. Nanti pihak admin booking akan mengirimkan nominal pembayaran untuk booking melalui WhatsApp Anda.",
                      style: GoogleFonts.montserrat(
                        fontSize: 17,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 80),
                    ElevatedButton(
                      onPressed: () {
                        String message =
                            "Nama: ${namaController.text}\nNo HP: ${nohpController.text}\nAlamat: ${alamatController.text}\nJumlah Meja: ${mejaController.text}";
                        _launchWhatsApp("6289670049785", message);
                      },
                      child: Text(
                        "Booking Sekarang",
                        style: GoogleFonts.montserrat(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        backgroundColor: Color(0xff0B724D),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Booking(),
  ));
}
