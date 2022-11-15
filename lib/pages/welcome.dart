import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:bambinut/login.dart';
import 'package:bambinut/sign.dart';

class welcome extends StatelessWidget {
  const welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final bodyheight =
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 167, 210, 203),
        width: MediaQuery.of(context).size.width,
      child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 100),
              child: Text(
                "Welcome to Bambinut",
                style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 135, 76, 98),
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 50,),
            Image.asset(
              "assets/images/logo.png",
              width: 300,
              height: 300,
            ),
            SizedBox(height: 50,),
            Material(
                child: InkWell(
                  child: Container(
                      height: 50,
                      width: 300,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Center(
                        child: Text("Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),)),
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed(loginpage.nameRoute);
                  },
                  borderRadius: BorderRadius.all(
                          Radius.circular(50)
                ),
                ),
                color: Color.fromARGB(255, 135, 76, 98),
                borderRadius: BorderRadius.all(
                          Radius.circular(50)
                ),
              ),
              SizedBox(height: 10,),
              Material(
                child: InkWell(
                  child: Container(
                      height: 50,
                      width: 300,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Center(
                        child: Text("Sign Up",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),)),
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed(signuppage.nameRoute);
                  },
                  borderRadius: BorderRadius.all(
                          Radius.circular(50)
                ),
                ),
                color: Color.fromARGB(255, 242, 211, 136),
                borderRadius: BorderRadius.all(
                          Radius.circular(50)
                ),
              ),
          ],
        ),
    ));
  }
}