import 'package:flutter/material.dart';
import 'package:testing/login.dart';
import 'package:testing/pages/home.dart';
import 'package:testing/pages/insight.dart';
import 'package:testing/pages/list.dart';
import 'package:testing/pages/profile.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;

  int pilihanbottom =  0;

  final List<Widget> children =
  [
    homepage(),
    insight(),
    listpage(),
    profile()
  ];

  void onTappedItem(int index) {
    setState(() {
      pilihanbottom = index;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Home',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: Scaffold(
          body: Center(child: 
          children.elementAt(pilihanbottom)
          ),
          bottomNavigationBar: BottomNavigationBar(
          // currentIndex: 4,
          backgroundColor: Colors.orange,
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
        onTap: onTappedItem),
        ),
        routes: {
          homepage.nameRoute :(context) => homepage(),
          listpage.nameRoute :(context) => listpage(),
        }
   );
  }
}
