import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testing/pages/date.dart';
import 'package:testing/pages/profile.dart';
import 'home.dart';
import 'insight.dart';
import 'list.dart';

class menu extends StatefulWidget {
  static const nameRoute = '/menu';
  @override
  State<menu> createState() => _menuState();
}

class _menuState extends State<menu> {
  int counter = 0;

  int pilihanbottom =  0;

  final List<Widget> children =
  [
    homepage(),
    date(),
    insight(),
    listpage(),
    profile()
  ];

  void onTappedItem(int index) {
    setState(() {
      pilihanbottom = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Center(child: 
          children.elementAt(pilihanbottom)
          ),
          bottomNavigationBar: BottomNavigationBar(
          // currentIndex: 4,
          backgroundColor: Color.fromARGB(255, 242, 211, 136),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              ),
               BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: "Date",
              ),
            BottomNavigationBarItem(
              icon: Image(image: AssetImage("assets/images/chart.png"),width: 15),
              label: "Insight",
              ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: "Category",
              ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
              ),
        ],
        currentIndex: pilihanbottom,
        selectedIconTheme: IconThemeData(color: Color.fromARGB(255, 104, 96, 88)),
        onTap: onTappedItem),
        );
  }
}