import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:testing/providers/food.dart';
import 'package:testing/providers/foods.dart';

class food_detail extends StatelessWidget {
  static const nameRoute = '/food_detail';

  @override
  Widget build(BuildContext context) {
    final foodName = ModalRoute.of(context)?.settings.arguments as String;
    final food = Provider.of<Foods>(context).findbyName(foodName);
    return Scaffold(
        appBar: AppBar(
          title: Text("$foodName",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 19)),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 167, 210, 203),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Container(
          color: Color.fromARGB(255, 167, 210, 203),
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Image.asset(
                    "${food.image}",
                    width: 400,
                    height: 200,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  children: [
                    Text("Key Nutrients",
                        style: TextStyle(
                            // color: Colors.accents,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                    SizedBox(height: 20),
                    Container(
                      height: 30,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          for (String nutri in food.keyNutri)
                            Center(
                              child: Row(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(
                                      nutri,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          height: 1.5),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  )
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Text("Prep and Serve",
                        style: TextStyle(
                            // color: Colors.accents,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                    SizedBox(height: 10),
                    Text(
                      "${food.description} Lorem ipsum dolor sit amet, consectetur adipiscing elit. In "
                      "rutrum at ex non eleifend. Aenean sed eros a purus "
                      "gravida scelerisque id in orci. Mauris elementum id "
                      "nibh et dapibus. Maecenas lacinia volutpat magna",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          color: Colors.black, fontSize: 16, height: 1.5),
                    ),
                    SizedBox(height: 40),
                  ],
                ),
              ),
              property()
            ],
          ),
        ));
  }

  Widget property() {
    return Container(
      // padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Feeding History",
              style: TextStyle(
                  // color: Colors.accents,
                  fontWeight: FontWeight.bold,
                  fontSize: 16)),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    height: 60,
                    width: 60,
                    child: Center(child: Icon(Icons.star)),
                    // child: selectedColor == colors[index]? Image.asset("images/checker.png") : SizedBox(),
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(37)),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    width: 60,
                    child: Center(child: Text("To Try")),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    height: 60,
                    width: 60,
                    child: Center(child: Icon(Icons.line_axis)),
                    // child: selectedColor == colors[index]? Image.asset("images/checker.png") : SizedBox(),
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(37)),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    width: 60,
                    child: Center(child: Text("Trying")),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    height: 60,
                    width: 60,
                    child: Center(child: Icon(Icons.check)),
                    // child: selectedColor == colors[index]? Image.asset("images/checker.png") : SizedBox(),
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(37)),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    width: 60,
                    child: Center(child: Text("Tried")),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    height: 60,
                    width: 60,
                    child: Center(child: Icon(Icons.warning)),
                    // child: selectedColor == colors[index]? Image.asset("images/checker.png") : SizedBox(),
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(37)),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 8, bottom: 8),
                    width: 60,
                    child: Center(child: Text("Watchlist",style: TextStyle(fontSize: 12),)),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
