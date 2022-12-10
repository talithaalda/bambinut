import 'dart:async';

import 'package:bambinut/login.dart';
import 'package:bambinut/main.dart';
import 'package:bambinut/providers/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:bambinut/pages/menu.dart';
import 'package:bambinut/pages/welcome.dart';
import 'package:provider/provider.dart';

class splash extends StatefulWidget {
  const splash({Key key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    // TODO: implement setState
    super.initState();
    Provider.of<Users>(context, listen: false).token != null
        ? Timer(
            Duration(seconds: 8),
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => menu()),
            ),
          )
        : Timer(
            Duration(seconds: 8),
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Consumer<Users>(
                  builder: (context, auth, child) =>
                      auth.isAuth ? menu() : loginpage(),
                ),
              ),
            ),
          );
    // Timer(Duration(seconds: 3), () {
    //   Navigator.pushReplacement(
    //       context, MaterialPageRoute(builder: ((context) => welcome())));
    // });
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
              "assets/images/logo.png",
              width: 300,
              height: 300,
            ),
          ],
        ),
      ),
    );
  }
}
