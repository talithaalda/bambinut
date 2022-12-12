import 'package:bambinut/providers/user.dart';
import 'package:flutter/material.dart';
import 'package:bambinut/login.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class signuppage extends StatefulWidget {
  const signuppage({Key key}) : super(key: key);
  static const nameRoute = '/signup';

  @override
  State<signuppage> createState() => _signuppageState();
}

class _signuppageState extends State<signuppage> {
  final TextEditingController nameC = TextEditingController();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();
  final TextEditingController confirmpasswordC = TextEditingController();
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    final users = Provider.of<Users>(context, listen: false);
    Duration loginTime = Duration(milliseconds: 2250);
    Future<void> _authUserSignUp(String name, String email, String password) {
      return Future.delayed(loginTime).then((_) async {
        try {
          await Provider.of<Users>(context, listen: false)
              .signup(name, email, password);
          print("Berhasil signup");
          Navigator.of(context).pushNamed(loginpage.nameRoute);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Berhasil membuat akun, silahkan login!"),
              duration: Duration(seconds: 2),
            ),
          );
        } catch (err) {
          print(err);
          errorMessage = err.toString();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(errorMessage),
            backgroundColor: Colors.red,
          ));
        }
      });
    }

    return Scaffold(
      body: new GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
          color: Color.fromARGB(255, 167, 210, 203),
          child: Padding(
              padding: const EdgeInsets.all(30),
              child: Form(
                key: _form,
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
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        )),
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Color.fromARGB(255, 242, 211, 136),
                      ),
                      child: TextField(
                        controller: nameC,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.person,
                              color: Color.fromARGB(255, 116, 116, 116)),
                          labelText: 'Name',
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
                        controller: emailC,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.email,
                              color: Color.fromARGB(255, 116, 116, 116)),
                          labelText: 'Email',
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Stack(children: [
                      Container(
                        // padding: const EdgeInsets.all(10),
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Color.fromARGB(255, 242, 211, 136),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6),
                        child: TextFormField(
                          controller: passwordC,
                          validator: (val) {
                            if (val.isEmpty) return 'Empty';
                            return null;
                          },
                          obscureText: true,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(bottom: 10),
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Color.fromARGB(255, 116, 116, 116),
                            ),
                            labelText: 'Password',
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                          ),
                        ),
                      ),
                    ]),
                    SizedBox(height: 10),
                    Stack(children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Color.fromARGB(255, 242, 211, 136),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6),
                        child: TextFormField(
                          controller: confirmpasswordC,
                          validator: (val) {
                            if (val.isEmpty) {
                              return 'Empty';
                            }
                            if (val != passwordC.text) {
                              return 'Not Match';
                            } else {
                              return null;
                            }
                          },
                          obscureText: true,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(bottom: 10),
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.lock,
                                color: Color.fromARGB(255, 116, 116, 116)),
                            labelText: 'Re-Type Password',
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                          ),
                        ),
                      ),
                    ]),
                    SizedBox(height: 20),
                    Material(
                      child: InkWell(
                        child: Container(
                          height: 50,
                          width: 20,
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: OutlinedButton(
                            onPressed: () {
                              if (_form.currentState.validate()) {
                                _authUserSignUp(
                                    nameC.text, emailC.text, passwordC.text);
                              }
                            },
                            child: Center(
                                child: Text(
                              "Sign up",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      color: Color.fromARGB(255, 135, 76, 98),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    Row(
                      children: <Widget>[
                        const Text('Already have account?'),
                        TextButton(
                          child: const Text(
                            'Log in',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 135, 76, 98),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(loginpage.nameRoute);
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
