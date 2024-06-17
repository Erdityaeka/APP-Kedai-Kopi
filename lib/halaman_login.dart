import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kedakopi/nav.dart'; // Sesuaikan path impor sesuai dengan struktur proyek Anda

class LOGIN extends StatelessWidget {
  LOGIN({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              "assets/cangkirkopi.jpg",
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Positioned(
              top: 50,
              child: Text(
                "Selamat Datang",
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              bottom: 50,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 81, 45, 8),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TombolNav(),
                      ),
                    );
                  },
                  child: Text(
                    'Masuk',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
