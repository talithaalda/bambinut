import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:bambinut/pages/date.dart';
import 'package:bambinut/widget/theme.dart';
import 'package:bambinut/providers/foods.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:bambinut/pages/menu.dart';

import '../database_services.dart';

class createFood extends StatefulWidget {
  static const nameRoute = '/createfood';

  @override
  State<createFood> createState() => _createFoodState();
}

class _createFoodState extends State<createFood> {
  String getId() {
    final now = DateTime.now();
    return now.microsecondsSinceEpoch.toString();
  }

  int selectedIndexFG = -1;
  int selectedIndexFH = -1;
  String foodimageC = '';
  String foodGrup = '';
  String feedHist = '';
  // String id = json.decode(response.body)["name"].toString();
  late File selectedImage;
  String imagePath = 'null';
  final TextEditingController foodnameC = TextEditingController();
  final TextEditingController descC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final foods = Provider.of<Foods>(context, listen: false);
    return Scaffold(
      backgroundColor: greentosca,
      appBar: AppBar(
        title: Text("Create a food",
            style: TextStyle(
                fontWeight: FontWeight.w100, fontSize: 19, color: darkchoco)),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 167, 210, 203),
        elevation: 0,
        iconTheme: IconThemeData(color: darkchoco),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: ListView(
            children: [
              DottedBorder(
                borderType: BorderType.RRect,
                color: Color.fromARGB(255, 129, 128, 128),
                radius: Radius.circular(10),
                strokeWidth: 2,
                dashPattern: [10, 6],
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0x00000000),
                    shadowColor: Colors.transparent.withOpacity(0.1),
                  ),
                  onPressed: () async {
                    final ImagePicker _picker = ImagePicker();
                    final XFile? image =
                        await _picker.pickImage(source: ImageSource.gallery);
                    selectedImage = File(image!.path);
                    imagePath = await DatabaseServices.uploadImageFood(
                      selectedImage,
                      getId(),
                    );
                    setState(() {
                      foodimageC = imagePath;
                    });
                  },
                  child: (imagePath == 'null')
                      ? Container(
                          height: 150,
                          width: 330,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/camera.png"),
                            ),
                          ),
                        )
                      : Stack(children: [
                          Container(
                            height: 150,
                            width: 330,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage("$imagePath"),
                              ),
                            ),
                          ),
                          Container(
                            height: 150,
                            width: 330,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/camera.png"),
                              ),
                            ),
                          ),
                        ]),
                ),
              ),
              SizedBox(height: 26),
              Container(
                height: 42,
                width: 320,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(36)),
                    color: Color.fromARGB(255, 242, 211, 136),
                    border: Border.all(color: darkchoco)),
                child: TextFormField(
                  controller: foodnameC,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.food_bank),
                    labelText: 'Food name',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
              ),
              SizedBox(height: 26),
              Container(
                padding: const EdgeInsets.only(left: 10, top: 5),
                height: 110,
                width: 320,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color.fromARGB(255, 242, 211, 136),
                    border: Border.all(color: darkchoco)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Food Group",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: darkchoco,
                          fontSize: 16),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        foodGroup(0, "assets/images/grain.png", "Grain"),
                        SizedBox(width: 11),
                        foodGroup(
                            1, "assets/images/vegetable.png", "Vegetable"),
                        SizedBox(width: 11),
                        foodGroup(2, "assets/images/fruits.png", "Fruit"),
                        SizedBox(width: 11),
                        foodGroup(3, "assets/images/protein.png", "Protein"),
                        SizedBox(width: 11),
                        foodGroup(4, "assets/images/dairy.png", "Dairy"),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 26),
              Container(
                padding: const EdgeInsets.only(left: 10, top: 5),
                height: 105,
                width: 320,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color.fromARGB(255, 242, 211, 136),
                    border: Border.all(color: darkchoco)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Feeding History",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: darkchoco,
                          fontSize: 16),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          feedingHistory(
                              0, "assets/images/totry.png", "To Try"),
                          feedingHistory(
                              1, "assets/images/trying.png", "Trying"),
                          feedingHistory(2, "assets/images/tried.png", "Tried"),
                          feedingHistory(
                              3, "assets/images/watchlist.png", "Watchlist"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 26,
              ),
              DottedBorder(
                borderType: BorderType.RRect,
                color: darkchoco,
                radius: Radius.circular(10),
                strokeWidth: 2,
                dashPattern: [10, 6],
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: yellowpale,
                  ),
                  child: Center(
                    child: TextFormField(
                      textAlign: TextAlign.justify,
                      maxLines: 100,
                      controller: descC,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          contentPadding:
                              EdgeInsets.only(left: 15, right: 15, bottom: 15),
                          label: Center(child: Text("Descriptions"))),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 26,
              ),
              // Container(
              //   height: 42,
              //   width: 320,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.all(Radius.circular(36)),
              //       color: Color.fromARGB(255, 242, 211, 136),
              //       border: Border.all(color: darkchoco)),
              //   child: TextFormField(
              //     controller: foodimageC,
              //     decoration: const InputDecoration(
              //       border: InputBorder.none,
              //       prefixIcon: Icon(Icons.camera),
              //       labelText: 'Food Image Url',
              //       floatingLabelBehavior: FloatingLabelBehavior.never,
              //       contentPadding:
              //           EdgeInsets.symmetric(horizontal: 5, vertical: -13),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 26,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: Container(
                  height: 50,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: darkchoco,
                  ),
                  child: OutlinedButton(
                    onPressed: () {
                      foods
                          .addFood(
                        getId(),
                        foodnameC.text,
                        descC.text,
                        foodGrup,
                        feedHist,
                        foodimageC,
                      )
                          .then(
                        (response) {
                          print("Kembali ke Home & kasih notif snack bar");
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Berhasil ditambahkan"),
                              duration: Duration(seconds: 2),
                            ),
                          );
                          menu.navbottom = false;
                          Navigator.pop(context);
                        },
                      );
                    },
                    child: Center(
                        child: Text(
                      "Save",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    )),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget foodGroup(int index, String image, String title) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndexFG = index;
          foodGrup = title;
        });
      },
      child: Container(
        child: Column(
          children: [
            Container(
              height: 46,
              width: 46,
              decoration: BoxDecoration(
                border: Border.all(
                    width: 2,
                    color: selectedIndexFG == index
                        ? Color.fromARGB(255, 252, 84, 0)
                        : Colors.transparent),
                borderRadius: BorderRadius.circular(32),
              ),
              child: Image(
                image: AssetImage(image),
              ),
            ),
            Text(
              title,
              style: TextStyle(color: darkchoco, fontSize: 12),
            )
          ],
        ),
      ),
    );
  }

  Widget feedingHistory(int index, String image, String title) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndexFH = index;
          feedHist = title;
        });
      },
      child: Container(
        child: Column(
          children: [
            Container(
              height: 46,
              width: 46,
              decoration: BoxDecoration(
                border: Border.all(
                    width: 2,
                    color: selectedIndexFH == index
                        ? Color.fromARGB(255, 252, 84, 0)
                        : Colors.transparent),
                borderRadius: BorderRadius.circular(32),
              ),
              child: Image(
                image: AssetImage(image),
              ),
            ),
            Text(
              title,
              style: TextStyle(color: darkchoco, fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
