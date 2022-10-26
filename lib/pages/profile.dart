import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:testing/widget/theme.dart';

class profile extends StatefulWidget {
  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  TextEditingController date = TextEditingController();

  @override
  void initState() {
    date.text = ""; //set Fthe initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greentosca,
      appBar: AppBar(
          title: Text("Baby Profile"),
          centerTitle: true,
          leading: null,
          // actions: [
          //   IconButton(
          //     onPressed: null,
          //     icon: Icon(Icons.settings),
          //     color: Colors.white,
          //   )
          // ],
          automaticallyImplyLeading: false),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
          padding: EdgeInsets.only(left: 15, top: 20, right: 15),
          child: ListView(
            padding: EdgeInsets.all(15),
            children: [
              Container(
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Positioned(
                      child: Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                            border: Border.all(width: 4, color: Colors.white),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.2))
                            ],
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/images/baby.jpg"))),
                      ),
                    ),
                    Positioned(
                        bottom: 1,
                        right: 1,
                        child: Container(
                            child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Icon(Icons.add_a_photo, color: Colors.white),
                        ))),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.all(8.0),
                alignment: Alignment.topLeft,
                child: Text("What's your baby name?",
                    style: TextStyle(color: darkchoco)),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Color.fromARGB(255, 242, 211, 136),
                  border: Border.all(color: darkchoco),

                ),
                child: TextField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.person,
                        color: Color.fromARGB(255, 116, 116, 116)),
                    label: Text("Baby Name",style: TextStyle(color: Colors.black),),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(8.0),
                alignment: Alignment.topLeft,
                child: Text("Date of birth?",
                    style: TextStyle(color: darkchoco)),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Color.fromARGB(255, 242, 211, 136),
                  border: Border.all(color: darkchoco),

                ),
                child: TextField(
                  controller: date,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.calendar_today,
                        color: Color.fromARGB(255, 116, 116, 116)),
                    label: Text('Select Date',style: TextStyle(color: Colors.black),),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                  readOnly: true,
                  onTap: () async {
                    DateTime? newDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100));

                    if (newDate != null) {
                      print(
                          newDate); //newDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                          DateFormat.yMMMMd('en_US').format(newDate);

                      print(
                          formattedDate); //formatted date output using intl package =>  2021-03-16
                      //you can implement different kind of Date Format here according to your requirement

                      setState(() {
                        date.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {
                      print("Date is not selected");
                    }
                  },
                ),
              ),
              SizedBox(height: 40),
              Material(
                child: InkWell(
                  splashColor: Colors.white,
                  child: Container(
                    height: 50,
                    width: 300,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Center(
                        child: Text(
                      "Save",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    )),
                  ),
                  onTap: () {},
                ),
                color: darkchoco,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Material(
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.all(Radius.circular(50)),
          splashColor: Colors.white,
          child: Container(
            height: 40.0,
            width: 100.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.logout_rounded, color: Colors.white),
                Text("Sign Out",style: TextStyle(color: Colors.white),)
              ],
            ),
          ),
        ),
        color: darkchoco,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
  }
}
