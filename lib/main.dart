import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart' as badge;
import 'package:kedakopi/halaman_login.dart';
import 'package:kedakopi/models/menu_model.dart';
import 'package:http/http.dart' as myHttp;
import 'package:kedakopi/providers/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:open_whatsapp/open_whatsapp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => CartProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LOGIN(),
      ),
    );
  }
}

class Pesann extends StatefulWidget {
  const Pesann({Key? key}) : super(key: key);

  @override
  _PesannState createState() => _PesannState();
}

class _PesannState extends State<Pesann> {
  TextEditingController namaController = TextEditingController();
  TextEditingController nomejaController = TextEditingController();
  TextEditingController deskirpisiController = TextEditingController();

  final String urlMenu =
      "https://script.google.com/macros/s/AKfycbycOloyNWpbh6MVP0LaYlYf_waWJUFUP7D9AK_jRqDa6B-lj3sprU29L74GcsT_fJAgJw/exec";

  Future<List<MenuModel>> getAllData() async {
    List<MenuModel> listMenu = [];
    var response = await myHttp.get(Uri.parse(urlMenu));
    List data = json.decode(response.body);

    data.forEach((element) {
      listMenu.add(MenuModel.fromJson(element));
    });

    return listMenu;
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: 650,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "Pengisian Form Pemesanan",
                    style: GoogleFonts.montserrat(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "NAMA",
                    style: GoogleFonts.montserrat(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextFormField(
                    controller: namaController,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "No Meja",
                    style: GoogleFonts.montserrat(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextFormField(
                    controller: nomejaController,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Deskripsi",
                    style: GoogleFonts.montserrat(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 100,
                    child: TextFormField(
                      controller: deskirpisiController,
                      maxLines: null,
                      expands: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText:
                            "Untuk Minuman dan Kopi \n Ingin Hangat/ Dingin",
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
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
                    "Silahkan melakukan booking pemesanan terlebih dahulu.Nanti Pembayarannya Di Kasir",
                    style: GoogleFonts.montserrat(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Consumer<CartProvider>(
                    builder: (context, value, _) {
                      String strPesanan = "";
                      int totalHarga = 0;
                      value.cart.forEach((element) {
                        int hargaItem = element.price! * element.quantity;
                        totalHarga += hargaItem;
                        strPesanan +=
                            "\n${element.name} (${element.quantity}) - Rp. ${hargaItem}";
                      });
                      strPesanan +=
                          "\nTotal Harga: Rp. $totalHarga"; // Menambahkan total harga ke dalam pesanan
                      return ElevatedButton(
                        onPressed: () async {
                          String pesanan = "Nama: ${namaController.text}\n"
                              "Nomor Meja: ${nomejaController.text}\n"
                              "Deskripsi: ${deskirpisiController.text}\n"
                              "\nPesanan: $strPesanan";
                          FlutterOpenWhatsapp.sendSingleMessage(
                              "6273627", pesanan);
                          print(pesanan);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Color(0xff0B724D), // Warna background tombol
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          textStyle: GoogleFonts.montserrat(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: Text(
                          "Pesan Sekarang",
                          style: TextStyle(
                            color: Colors.white, // Warna teks tombol
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildMenuItem(MenuModel menu) {
    return Container(
      margin: EdgeInsets.only(left: 8.0),
      width: 250,
      height: 290,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 211, 210, 210),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipOval(
                child: Image.network(
                  menu.image,
                  height: 120,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 160.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    menu.name,
                    style: GoogleFonts.montserrat(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    menu.description,
                    style: GoogleFonts.montserrat(
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            // Penanganan jika price null
                            "Rp. ${menu.price ?? 'Price not available'}",
                            style: GoogleFonts.montserrat(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Provider.of<CartProvider>(
                                  context,
                                  listen: false,
                                ).addRemove(
                                    menu.name, menu.price, menu.id, false);
                              },
                              icon: Icon(
                                Icons.remove_circle,
                                color: Colors.red,
                              ),
                            ),
                            Consumer<CartProvider>(
                              builder: (context, value, _) {
                                var id = value.cart.indexWhere(
                                    (element) => element.menuId == menu.id);
                                return Text(
                                  (id == -1)
                                      ? "0"
                                      : value.cart[id].quantity.toString(),
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.montserrat(fontSize: 15),
                                );
                              },
                            ),
                            IconButton(
                              onPressed: () {
                                Provider.of<CartProvider>(
                                  context,
                                  listen: false,
                                ).addRemove(
                                    menu.name, menu.price, menu.id, true);
                              },
                              icon: Icon(
                                Icons.add_circle,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget loadingWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(),
        SizedBox(height: 20),
        Text(
          'Loading...',
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffD0986F),
        onPressed: () {
          openDialog(context);
        },
        child: badge.Badge(
          badgeContent: Consumer<CartProvider>(
            builder: (context, value, _) {
              return Text(
                (value.total > 0) ? value.total.toString() : "",
                style: GoogleFonts.montserrat(color: Colors.white),
              );
            },
          ),
          child: Icon(
            Icons.shopping_bag,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: FutureBuilder<List<MenuModel>>(
          future: getAllData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: loadingWidget(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Error loading data',
                  style: GoogleFonts.montserrat(fontSize: 18),
                ),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                child: Text(
                  'No data available',
                  style: GoogleFonts.montserrat(fontSize: 18),
                ),
              );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    child: Text(
                      'Hai',
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 16.0),
                    child: Text(
                      "Jika ingin pesan silahkan lihat menu di bawah ini 😊",
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: (snapshot.data!.length / 2).ceil(),
                      itemBuilder: (context, index) {
                        int firstItemIndex = index * 2;
                        int secondItemIndex = firstItemIndex + 1;
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: buildMenuItem(
                                  snapshot.data![firstItemIndex],
                                ),
                              ),
                              SizedBox(width: 16),
                              if (secondItemIndex < snapshot.data!.length)
                                Expanded(
                                  child: buildMenuItem(
                                    snapshot.data![secondItemIndex],
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
