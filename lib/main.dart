import 'package:bambinut/pages/editfood.dart';
import 'package:flutter/material.dart';
import 'package:bambinut/login.dart';
import 'package:bambinut/pages/category_detail.dart';
import 'package:bambinut/pages/createfood.dart';
import 'package:bambinut/pages/createmeal.dart';
import 'package:bambinut/pages/date.dart';
import 'package:bambinut/pages/food_detail.dart';
import 'package:bambinut/pages/home.dart';
import 'package:bambinut/pages/insight.dart';
import 'package:bambinut/pages/list.dart';
import 'package:bambinut/pages/menu.dart';
import 'package:bambinut/pages/profile.dart';
import 'package:intl/intl.dart';
import 'package:bambinut/pages/splashscreen.dart';
import 'package:bambinut/pages/welcome.dart';
import 'package:bambinut/login.dart';
import 'package:bambinut/providers/foods.dart';
import 'package:bambinut/sign.dart';
import 'package:provider/provider.dart';
import 'package:bambinut/providers/food.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bambinut/widget/theme.dart';

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
            colorScheme: ThemeData().colorScheme.copyWith(
              primary:Colors.grey[600]
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
            editFood.nameRoute: (context) => editFood(),

          }),
    );
  }
}
