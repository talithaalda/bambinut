import 'package:flutter/material.dart';
import 'package:testing/login.dart';
import 'package:testing/pages/food_detail.dart';
import 'package:testing/pages/home.dart';
import 'package:testing/pages/insight.dart';
import 'package:testing/pages/list.dart';
import 'package:testing/pages/menu.dart';
import 'package:testing/pages/profile.dart';
import 'package:intl/intl.dart';
import 'package:testing/pages/splashscreen.dart';
import 'package:testing/pages/welcome.dart';
import 'package:testing/login.dart';
import 'package:testing/providers/foods.dart';
import 'package:testing/sign.dart';
import 'package:provider/provider.dart'; 
import 'package:testing/providers/food.dart';
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
    
    return ChangeNotifierProvider(
      create: (context) => Foods(),
      child: MaterialApp(
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
            home:  splash(),
            routes: {
              homepage.nameRoute :(context) => homepage(),
              listpage.nameRoute :(context) => listpage(),
              loginpage.nameRoute :(context) => loginpage(),
              signuppage.nameRoute :(context) => signuppage(),
              menu.nameRoute :(context) => menu(),
              food_detail.nameRoute :(context) => food_detail(),
      
            }
      ),
    );
  }
}
