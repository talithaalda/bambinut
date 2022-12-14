import 'package:bambinut/pages/home.dart';
import 'package:bambinut/providers/user.dart';
import 'package:flutter/material.dart';
import 'package:bambinut/pages/menu.dart';
import 'package:bambinut/sign.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class loginpage extends StatefulWidget {
  const loginpage({Key key}) : super(key: key);
  static const nameRoute = '/login';

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();
  String errorMessage = '';
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final users = Provider.of<Users>(context, listen: false);
    Duration loginTime = Duration(milliseconds: 2250);

    Future<void> _authUserLogin(String email, String password) {
      return Future.delayed(loginTime).then((_) async {
        try {
          await Provider.of<Users>(context, listen: false)
              .login(email, password);
          print("Berhasil login");

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Berhasil login"),
              duration: Duration(seconds: 2),
            ),
          );
        } catch (err) {
          print("INI ERROR");

          print(err);
          errorMessage = err.toString();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        }
      });
    }

    // Future<String> _recoverPassword(String name) {
    //   print('Name: $name');
    //   return Future.delayed(loginTime).then((_) {
    //     if (!users.containsKey(name)) {
    //       return 'Username not exists';
    //     }
    //     return null;
    //   });
    // }

    return Scaffold(
      body: new GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
          color: Color.fromARGB(255, 167, 210, 203),
          child: Padding(
              padding: const EdgeInsets.all(30),
              child: ListView(
                children: <Widget>[
                  Container(
                      height: 100,
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(top: 50),
                      child: Image.asset(
                        "assets/images/textlogo.png",
                        width: 300,
                        height: 300,
                      )),
                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(top: 30, bottom: 30),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      )),
                  Container(
                    padding: const EdgeInsets.all(10),
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: Color.fromARGB(255, 242, 211, 136),
                    ),
                    child: TextField(
                      controller: emailC,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.person,
                            color: Color.fromARGB(255, 116, 116, 116)),
                        labelText: 'Email',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(10),
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: Color.fromARGB(255, 242, 211, 136),
                    ),
                    child: TextField(
                      controller: passwordC,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.lock,
                            color: Color.fromARGB(255, 116, 116, 116)),
                        labelText: 'Password',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Material(
                    child: InkWell(
                      child: Container(
                        height: 50,
                        width: 20,
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: OutlinedButton(
                          onPressed: () async {
                            _authUserLogin(emailC.text, passwordC.text);
                          },
                          child: Center(
                              child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                    ),
                    color: Color.fromARGB(255, 135, 76, 98),
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  Row(
                    children: <Widget>[
                      const Text("Don't have account?"),
                      TextButton(
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 135, 76, 98),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(signuppage.nameRoute); //signup screen
                        },
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
