import 'package:flutter/material.dart';
import 'package:bambinut/login.dart';
class signuppage extends StatelessWidget {
  const signuppage({Key? key}) : super(key: key);
  static const nameRoute = '/signup';
  @override
  Widget build(BuildContext context) {
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
                    padding: const EdgeInsets.only(top: 30,bottom: 30),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),
                    )),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(50)
                      ),
                      color: Color.fromARGB(255, 242, 211, 136),
                  ),
                  child: TextField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon:Icon(Icons.person, color: Color.fromARGB(255, 116, 116, 116)),
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
                    borderRadius: BorderRadius.all(
                        Radius.circular(50)
                      ),
                      color: Color.fromARGB(255, 242, 211, 136),
                  ),
                  child: TextField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon:Icon(Icons.email, color: Color.fromARGB(255, 116, 116, 116)),
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
                    borderRadius: BorderRadius.all(
                        Radius.circular(50)
                      ),
                      color: Color.fromARGB(255, 242, 211, 136),
                  ),
                  child: TextField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon:Icon(Icons.lock, color: Color.fromARGB(255, 116, 116, 116)),
                      labelText: 'Password',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(50)
                      ),
                      color: Color.fromARGB(255, 242, 211, 136),
                  ),
                  child: TextField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon:Icon(Icons.lock, color: Color.fromARGB(255, 116, 116, 116)),
                      labelText: 'Re-Type Password',
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
                        child: Center(
                          child: Text("Sign up",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),)),
                    ),
                    onTap: () {
                      
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
                Row(
                  children: <Widget>[
                    const Text('Already have account?'),
                    TextButton(
                      child: const Text(
                        'Log in',
                        style: TextStyle(fontSize: 20,
                        color: Color.fromARGB(255, 135, 76, 98),),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(loginpage.nameRoute);//signup screen
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ],
            )
            ),
        ),
      ),
      );
  }
}