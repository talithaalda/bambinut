import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testing/pages/menu.dart';
import 'package:testing/pages/welcome.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    // TODO: implement setState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: ((context) => welcome())));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 167, 210, 203),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/shrimp.png",
              width: 70,
              height: 70,
            ),
            Text(
              "Bambinut",
              style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 5, 58, 107),
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}