import 'package:flutter/material.dart';
import 'package:lafyuu/screens/homePage.dart';

class ScreensSwitcher extends StatefulWidget {
  const ScreensSwitcher({super.key});

  @override
  State<ScreensSwitcher> createState() => _ScreensSwitcherState();
}

class _ScreensSwitcherState extends State<ScreensSwitcher> {
  int selectedPage = 0;
  List<Widget> screens = [
    HomePage(),
    Text('1'),
    Text('2'),
    Text('3'),
    Text('4'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: screens[selectedPage]
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedPage,
        onTap: (page) {
          setState(() {
            selectedPage = page;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search_outlined), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.local_offer_outlined), label: 'Offers'),
          BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined), label: 'Account'),
        ],
      ),
    );
  }
}
