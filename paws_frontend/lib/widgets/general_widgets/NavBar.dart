
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:paws_frontend/screens/Nav_screens/nav1.dart';
import 'package:paws_frontend/screens/Nav_screens/nav2.dart';
import 'package:paws_frontend/screens/Nav_screens/nav3.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentIndex = 0;

  List myScreenList = [nav1(), nav2(), nav3()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: DotNavigationBar(
            backgroundColor: Colors.amberAccent,
            currentIndex: currentIndex,
            dotIndicatorColor: Colors.black,
            unselectedItemColor: Colors.black,
            selectedItemColor: Colors.grey,
            onTap: (index) {
              currentIndex = index;
              setState(() {});
            },
            items: [
              /// offer
              DotNavigationBarItem(
                icon: Icon(Icons.handshake),
              ),

              /// Adoubt
              DotNavigationBarItem(
                icon: Icon(Icons.pets),
              ),

              /// Profile
              DotNavigationBarItem(
                icon: Icon(Icons.person),
              ),
            ],
          ),
        ),
        body: myScreenList[currentIndex]);
  }
}
