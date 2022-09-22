import 'package:flutter/material.dart';
import 'package:testing/login.dart';
import 'package:testing/pages/home.dart';
import 'package:testing/pages/insight.dart';
import 'package:testing/pages/list.dart';
import 'package:testing/pages/menu.dart';
import 'package:testing/pages/profile.dart';
import 'package:intl/intl.dart';
import 'package:testing/pages/splashscreen.dart';
import 'package:testing/pages/welcome.dart';
import 'package:testing/login.dart';
import 'package:testing/sign.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme:AppBarTheme(
            color: Color.fromARGB(255, 242, 211, 136),
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 19,
              fontWeight: FontWeight.w600
            )),
        ),
        home: splash(),
        routes: {
          homepage.nameRoute :(context) => homepage(),
          listpage.nameRoute :(context) => listpage(),
          loginpage.nameRoute :(context) => loginpage(),
          signuppage.nameRoute :(context) => signuppage(),
          menu.nameRoute :(context) => menu()

        }
   );
  }
}
