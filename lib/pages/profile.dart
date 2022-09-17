import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class profile extends StatefulWidget {

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  TextEditingController date = TextEditingController();

  @override
  void initState() {
    date.text = ""; //set the initial value of text field
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 5, 58, 107),
      appBar: AppBar(
          title: Text("Baby Profile"),
          centerTitle: true,
          leading: IconButton(onPressed: null, 
          icon: Icon(Icons.arrow_back),
          color: Colors.white,),
          actions: [IconButton(
            onPressed: null, 
            icon: Icon(Icons.settings),
            color: Colors.white,)],
        ),
      body: GestureDetector(
         onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
              },
          child: Container(
            padding: EdgeInsets.only(left: 15,top: 20,right: 15),
              child:Column(
                children: [
                  Container(
                    child: Stack(
                      children: [
                        Positioned(
                          child: Container(
                            width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                            border: Border.all(width: 4,color: Colors.white),
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.2)
                              )
                            ],
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/baby.jpg")
                            )
                          ),
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
                    style: 
                    TextStyle(color: Colors.white)),
                  ),
                  Container(
                  padding: const EdgeInsets.all(10),
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(50)
                      ),
                      color:  Color.fromARGB(255, 158, 195, 243),
                  ),
                  child: TextField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon:Icon(Icons.person, color: Color.fromARGB(255, 116, 116, 116)),
                      labelText: "Baby Name",
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                    padding: EdgeInsets.all(8.0),
                    alignment: Alignment.topLeft,
                    child: Text("Date of birth?",
                    style: 
                    TextStyle(color: Colors.white)),
                  ),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(50)
                      ),
                      color:  Color.fromARGB(255, 158, 195, 243),
                  ),
                  child: TextField(
                    controller: date,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon:Icon(Icons.calendar_today, color: Color.fromARGB(255, 116, 116, 116)),
                      labelText: 'Select Date',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                    readOnly: true,
                    onTap: () async{
                      DateTime? newDate = await showDatePicker(context: context,
                       initialDate: DateTime.now(), 
                       firstDate: DateTime(1900), 
                       lastDate: DateTime(2100));

                        if(newDate != null ){
                        print(newDate);  //newDate output format => 2021-03-10 00:00:00.000
                        String formattedDate = DateFormat('yyyy-MM-dd').format(newDate); 
                        print(formattedDate); //formatted date output using intl package =>  2021-03-16
                        //you can implement different kind of Date Format here according to your requirement

                      setState(() {
                         date.text = formattedDate; //set output date to TextField value. 
                      });
                      }else{
                          print("Date is not selected");
                      }
                    },
                  ),
                ),
                ],
              ),
          ),
      ),
    );
  }
}