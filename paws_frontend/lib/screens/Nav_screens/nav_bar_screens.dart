import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:paws_frontend/screens/Nav_screens/offers_screen.dart';
import 'package:paws_frontend/screens/Nav_screens/requests_screen.dart';
import 'package:paws_frontend/screens/Nav_screens/profile_screen.dart';

class NavBarScreens extends StatefulWidget {
  const NavBarScreens({super.key});

  @override
  NavBarScreensState createState() => NavBarScreensState();
}

class NavBarScreensState extends State<NavBarScreens> {
  int currentIndex = 1;

  List myScreenList = [
    const RequestsScreen(),
    const OffersScreen(),
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        bottomNavigationBar: DotNavigationBar(
          backgroundColor: const Color.fromARGB(255, 248, 212, 177),
          currentIndex: currentIndex,
          dotIndicatorColor: Colors.black,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.black,
          onTap: (index) {
            currentIndex = index;
            setState(() {});
          },
          items: [
            DotNavigationBarItem(
              icon: const Icon(Icons.front_hand),
            ),
            DotNavigationBarItem(
              icon: const Icon(Icons.pets),
            ),
            DotNavigationBarItem(
              icon: const Icon(Icons.person),
            ),
          ],
        ),
        body: myScreenList[currentIndex]);
  }
}
