import 'package:flutter/material.dart';
import 'package:kedakopi/booking/booking.dart';
import 'package:kedakopi/home.dart';
import 'package:kedakopi/main.dart';

class TombolNav extends StatefulWidget {
  TombolNav({Key? key});

  @override
  State<TombolNav> createState() => _TombolNavState();
}

class _TombolNavState extends State<TombolNav> {
  int _selectedTabIndex = 0;

  void _onNavBarTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> listpage = <Widget>[
      HalamanHome(),
      Pesann(),
      Booking(),
    ];

    final List<BottomNavigationBarItem> bottomNavBarItems =
        <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.shopping_bag),
        label: 'Pemesanan',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.content_paste),
        label: 'Booking',
      ),
    ];

    final BottomNavigationBar bottomNavBar = BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xffD0986F),
      items: bottomNavBarItems,
      currentIndex: _selectedTabIndex,
      unselectedItemColor: Color.fromARGB(137, 0, 0, 0),
      selectedItemColor: Colors.white,
      onTap: _onNavBarTapped,
    );

    return Scaffold(
      body: Center(
        child: listpage[_selectedTabIndex],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.white,
              width: 3.0,
            ),
          ),
        ),
        child: bottomNavBar,
      ),
    );
  }
}
