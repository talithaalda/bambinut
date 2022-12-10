import 'dart:io';

import 'package:bambinut/controller/database_services.dart';
import 'package:bambinut/pages/menu.dart';
import 'package:bambinut/providers/user.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:bambinut/widget/theme.dart';
import 'package:provider/provider.dart';

class profile extends StatefulWidget {
  @override
  State<profile> createState() => _profileState();
  static const nameRoute = '/profil';
}

class _profileState extends State<profile> {
  String imagePath = '';
  String imageUrlC = '';

  TextEditingController date;
  TextEditingController babyName;

  File selectedImage;
  @override
  void didChangeDependencies() {
    final usersProvider = Provider.of<Users>(context, listen: false);
    final users = usersProvider.selectById(usersProvider.uid);
    babyName = TextEditingController(text: users.babyName)
      ..addListener(() {
        setState(() {});
      });
    date = TextEditingController(text: users.dateBirth)
      ..addListener(() {
        setState(() {});
      });
    // date.text = users.dateBirth;

    imageUrlC = users.profileUrl;

    imagePath = users.profileUrl;
    super.didChangeDependencies();
  }

  // void initState() {
  //   // date.text = ""; //set Fthe initial value of text field
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    menu.navbottom = true;
    final usersProvider = Provider.of<Users>(context, listen: false);
    String userID = usersProvider.userID();
    final users = usersProvider.selectById(userID);

    return Scaffold(
      backgroundColor: greentosca,
      appBar: AppBar(
          title: Text("Baby Profile"),
          centerTitle: true,
          leading: null,
          automaticallyImplyLeading: false),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
          padding: EdgeInsets.only(left: 15, top: 20, right: 15),
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(15),
            children: [
              Container(
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    (users.profileUrl == null)
                        ? Positioned(
                            child: Container(
                              width: 130,
                              height: 130,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 4, color: Colors.white),
                                  boxShadow: [
                                    BoxShadow(
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                        color: Colors.black.withOpacity(0.2))
                                  ],
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          "https://astrarunners.com/assets/img/profile_picture.jpg"))),
                            ),
                          )
                        : Positioned(
                            child: Container(
                              width: 130,
                              height: 130,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 4, color: Colors.white),
                                  boxShadow: [
                                    BoxShadow(
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                        color: Colors.black.withOpacity(0.2))
                                  ],
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(imagePath))),
                            ),
                          ),
                    Positioned(
                      bottom: 1,
                      right: 1,
                      width: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0)),
                        ),
                        onPressed: () async {
                          final ImagePicker _picker = ImagePicker();
                          final XFile image = await _picker.pickImage(
                              source: ImageSource.gallery);
                          selectedImage = File(image.path);
                          imagePath = await DatabaseServices.uploadProfile(
                              selectedImage, users.uid);
                          setState(() {
                            users.profileUrl = imagePath;
                            imagePath = imagePath;
                            imageUrlC = imagePath;
                          });
                        },
                        child: Icon(
                          Icons.add_a_photo,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
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
                  controller: babyName,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.person,
                        color: Color.fromARGB(255, 116, 116, 116)),
                    label: Text(
                      "Baby Name",
                      style: TextStyle(color: Colors.black),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(8.0),
                alignment: Alignment.topLeft,
                child:
                    Text("Date of birth?", style: TextStyle(color: darkchoco)),
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
                    label: Text(
                      'Select Date',
                      style: TextStyle(color: Colors.black),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                  readOnly: true,
                  onTap: () async {
                    DateTime newDate = await showDatePicker(
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
                  onTap: () {
                    usersProvider
                        .editUser(
                      users.id,
                      users.uid,
                      babyName.text,
                      date.text,
                      imageUrlC,
                    )
                        .then((value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Berhasil diubah"),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    });
                  },
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
          onTap: () {
            Provider.of<Users>(context, listen: false).logout();
            menu.navbottom = false;
          },
          borderRadius: BorderRadius.all(Radius.circular(10)),
          splashColor: Colors.white,
          child: Container(
            height: 40.0,
            width: 100.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.logout_rounded, color: Colors.white),
                Text(
                  "Sign Out",
                  style: TextStyle(color: Colors.white),
                )
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

// Future<File> getImage() async {
//   print("hello");
//   final ImagePicker _picker = ImagePicker();
//     // Pick an image
//     final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
// }
