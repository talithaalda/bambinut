import 'package:flutter/material.dart';
import 'package:testing/pages/home.dart';
import 'package:testing/pages/list.dart';


class bottomnav extends StatefulWidget {
  @override
  State<bottomnav> createState() => _bottomnavState();
}

class _bottomnavState extends State<bottomnav> {
  int counter = 0;

  int pilihanbottom =  0;

  final List<Widget> children =
  [
    homepage(),
    listpage(),
  ];

  void onTappedItem(int index) {
    setState(() {
      pilihanbottom = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
          // currentIndex: 4,
          backgroundColor: Color.fromARGB(255, 255, 204, 2),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color.fromARGB(255, 252, 252, 252),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              ),
            BottomNavigationBarItem(
              icon: Icon(Icons.food_bank),
              label: "Insight",
              ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: "Lists",
              ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
              ),
        ],
        currentIndex: pilihanbottom,
        selectedIconTheme: IconThemeData(color: Colors.white),
        onTap: onTappedItem);
  }
}