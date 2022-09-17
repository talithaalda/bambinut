import 'package:flutter/material.dart';
void main() {
  runApp(const signuppage());
}

class signuppage extends StatelessWidget {
  const signuppage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: const Text("My Apps")),
        ),
      body: new GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: ListView(
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Bambinut',
                    style: TextStyle(
                        color: Color.fromARGB(255, 179, 11, 235),
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 20),
                  )),
              Container(
                padding: const EdgeInsets.all(10),
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(50)
                    ),
                    color: Color.fromARGB(255, 236, 190, 251),
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
              SizedBox(height: 7),
              Container(
                padding: const EdgeInsets.all(10),
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(50)
                    ),
                    color: Color.fromARGB(255, 236, 190, 251),
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
              SizedBox(height: 7),
              Container(
                padding: const EdgeInsets.all(10),
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(50)
                    ),
                    color: Color.fromARGB(255, 236, 190, 251),
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
              SizedBox(height: 20),
              Material(
                child: InkWell(
                  splashColor: Colors.brown,
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
                color: Color.fromARGB(255, 179, 11, 235),
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
                      color: Color.fromARGB(255, 179, 11, 235),),
                    ),
                    onPressed: () {
                      //signup screen
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