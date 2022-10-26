import 'package:flutter/material.dart';
import 'package:testing/login.dart';
import 'package:testing/pages/category_detail.dart';
import 'package:testing/pages/createfoof.dart';
import 'package:testing/pages/createmeal.dart';
import 'package:testing/pages/date.dart';
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
import 'package:google_fonts/google_fonts.dart';
import 'package:testing/widget/theme.dart';

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
            appBarTheme: AppBarTheme(
              color: Color.fromARGB(255, 242, 211, 136),
              titleTextStyle: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w600),
              iconTheme: IconThemeData(color: darkchoco),
            ),
            textTheme: GoogleFonts.poppinsTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
          home: splash(),
          routes: {
            homepage.nameRoute: (context) => homepage(),
            listpage.nameRoute: (context) => listpage(),
            loginpage.nameRoute: (context) => loginpage(),
            signuppage.nameRoute: (context) => signuppage(),
            menu.nameRoute: (context) => menu(),
            food_detail.nameRoute: (context) => food_detail(),
            date.nameRoute: (context) => date(),
            createFood.nameRoute: (context) => createFood(),
            createmeal.nameRoute: (context) => createmeal(),
            category_detail.nameRoute: (context) => category_detail(),

          }),
    );
  }
}
