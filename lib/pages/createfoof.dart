import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:testing/pages/date.dart';
import 'package:testing/widget/theme.dart';

class createFood extends StatelessWidget {
  static const nameRoute = '/createfood';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greentosca,
      appBar: AppBar(
        title: Text("Create a food",
            style: TextStyle(fontWeight: FontWeight.w100, fontSize: 19,color: darkchoco)),
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
          padding: const EdgeInsets.only( left: 30, right: 30),
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DottedBorder(
                borderType: BorderType.RRect,
                color: Color.fromARGB(255, 129, 128, 128),
                radius: Radius.circular(10),
                strokeWidth: 2,
                dashPattern: [10, 6],
                child: Container(
                  height: 150,
                  width: 300,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("assets/images/camera.png"),
                  )),
                ),
              ),
              SizedBox(height: 26),
              Container(
                padding: const EdgeInsets.only(left: 30),
                height: 42,
                width: 320,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(36)),
                    color: Color.fromARGB(255, 242, 211, 136),
                    border: Border.all(color: darkchoco)),
                child: TextFormField(
                  maxLines: null,
                  minLines: null,
                  expands: true,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Food name',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
              ),
              SizedBox(height: 26),
              Container(
                padding: const EdgeInsets.only(left: 10, top: 5),
                height: 100,
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
                        Column(
                          children: [
                            Image(image: AssetImage("assets/images/grain.png")),
                            Text(
                              "Grain",
                              style: TextStyle(color: darkchoco, fontSize: 12),
                            )
                          ],
                        ),
                        SizedBox(width: 11),
                        Column(
                          children: [
                            Image(
                                image:
                                    AssetImage("assets/images/vegetable.png")),
                            Text(
                              "Vegetable",
                              style: TextStyle(color: darkchoco, fontSize: 11),
                            )
                          ],
                        ),
                        SizedBox(width: 11),
                        Column(
                          children: [
                            Image(
                                image: AssetImage("assets/images/fruits.png")),
                            Text(
                              "Fruit",
                              style: TextStyle(color: darkchoco, fontSize: 12),
                            )
                          ],
                        ),
                        SizedBox(width: 11),
                        Column(
                          children: [
                            Image(
                                image: AssetImage("assets/images/protein.png")),
                            Text(
                              "Protein",
                              style: TextStyle(color: darkchoco, fontSize: 12),
                            )
                          ],
                        ),
                        SizedBox(width: 11),
                        Column(
                          children: [
                            Image(image: AssetImage("assets/images/dairy.png")),
                            Text(
                              "Dairy",
                              style: TextStyle(color: darkchoco, fontSize: 12),
                            )
                          ],
                        )
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
                      padding: const EdgeInsets.only(top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                height: 45,
                                width: 45,
                                child: Center(
                                    child: Icon(
                                  Icons.star,
                                  color: Colors.white,
                                )),
                                // child: selectedColor == colors[index]? Image.asset("images/checker.png") : SizedBox(),
                                decoration: BoxDecoration(
                                    color: darkchoco,
                                    borderRadius: BorderRadius.circular(37)),
                              ),
                              Text(
                                "To Try",
                                style:
                                    TextStyle(color: darkchoco, fontSize: 12),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 11,
                          ),
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                height: 45,
                                width: 45,
                                child: Center(
                                    child: Icon(
                                  Icons.line_axis,
                                  color: Colors.white,
                                )),
                                // child: selectedColor == colors[index]? Image.asset("images/checker.png") : SizedBox(),
                                decoration: BoxDecoration(
                                    color: darkchoco,
                                    borderRadius: BorderRadius.circular(37)),
                              ),
                              Text(
                                "Trying History",
                                style:
                                    TextStyle(color: darkchoco, fontSize: 12),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 11,
                          ),
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                height: 45,
                                width: 45,
                                child: Center(
                                    child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                )),
                                // child: selectedColor == colors[index]? Image.asset("images/checker.png") : SizedBox(),
                                decoration: BoxDecoration(
                                    color: darkchoco,
                                    borderRadius: BorderRadius.circular(37)),
                              ),
                              Text(
                                "Tried",
                                style:
                                    TextStyle(color: darkchoco, fontSize: 12),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 19,
                          ),
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                height: 45,
                                width: 45,
                                child: Center(
                                    child: Icon(
                                  Icons.warning,
                                  color: Colors.white,
                                )),
                                // child: selectedColor == colors[index]? Image.asset("images/checker.png") : SizedBox(),
                                decoration: BoxDecoration(
                                    color: darkchoco,
                                    borderRadius: BorderRadius.circular(37)),
                              ),
                              Text(
                                "Watchlist",
                                style:
                                    TextStyle(color: darkchoco, fontSize: 12),
                              )
                            ],
                          ),
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
                  alignment: Alignment.center,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: yellowpale,
                  ),
                  child: TextField(
                    maxLines: 100,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        label: Center(child: Text("Note"))),
                  ),
                ),
              ),
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
                  child: Center(
                      child: Text(
                    "Save",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  )),
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
}
