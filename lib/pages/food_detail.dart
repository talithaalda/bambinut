import 'package:bambinut/pages/editfood.dart';
import 'package:bambinut/pages/menu.dart';
import 'package:bambinut/pages/profile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:bambinut/providers/food.dart';
import 'package:bambinut/providers/foods.dart';
import 'package:bambinut/widget/theme.dart';

class food_detail extends StatefulWidget {
  static const nameRoute = '/food_detail';

  @override
  State<food_detail> createState() => _food_detailState();
}

class _food_detailState extends State<food_detail> {
  @override
  Widget build(BuildContext context) {
    final foodId = ModalRoute.of(context)?.settings.arguments as String;
    final foodsClass = Provider.of<Foods>(context);

    final foodsProvider = foodsClass.selectById(foodId);
    // final food = Provider.of<Foods>(context).selectById(foodName);
    return Scaffold(
      backgroundColor: greentosca,
      appBar: AppBar(
        title: Text(foodsProvider.title,
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 19)),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 167, 210, 203),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(editFood.nameRoute, arguments: foodId);
              },
              icon: Icon(Icons.edit),
              color: Color.fromARGB(255, 123, 11, 3)),
          IconButton(
              onPressed: () {
                menu.navbottom = false;
                foodsClass.deleteFood(foodsProvider.id).then(
                  (_) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Berhasil dihapus"),
                        duration: Duration(milliseconds: 500),
                      ),
                    );
                    Navigator.pop(context);

                    // Navigator.of(context).pushNamed(menu.nameRoute);
                  },
                );
              },
              icon: Icon(Icons.delete),
              color: Color.fromARGB(255, 123, 11, 3)),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Image.network(
                  "${foodsProvider.image}",
                  width: 400,
                  height: 200,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                children: [
                  Text("Category",
                      style: TextStyle(
                          // color: Colors.accents,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Text(
                      "${foodsProvider.category}",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          color: Colors.black, fontSize: 16, height: 1.5),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      border: Border.all(width: 1, color: darkchoco),
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(height: 20),
                  Text("Prep and Serve",
                      style: TextStyle(
                          // color: Colors.accents,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                  SizedBox(height: 10),
                  Text(
                    "${foodsProvider.description} Lorem ipsum dolor sit amet, consectetur adipiscing elit. In "
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
      ),
    );
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
                    child: Center(
                        child: Text(
                      "Watchlist",
                      style: TextStyle(fontSize: 12),
                    )),
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

//  Container(
                  //   height: 30,
                  //   child:
                  // ListView(
                  //   shrinkWrap: true,
                  //   scrollDirection: Axis.horizontal,
                  //   children: [
                  //     for (String nutri in food.keyNutri)
                  //       Center(
                  //         child: Row(
                  //           children: [
                  //             Container(
                  //               padding:
                  //                   EdgeInsets.symmetric(horizontal: 10),
                  //               child: Text(
                  //                 nutri,
                  //                 textAlign: TextAlign.justify,
                  //                 style: TextStyle(
                  //                     color: Colors.black,
                  //                     fontSize: 16,
                  //                     height: 1.5),
                  //               ),
                  //               decoration: BoxDecoration(
                  //                 color: Colors.amber,
                  //                 borderRadius: BorderRadius.circular(7),
                  //               ),
                  //             ),
                  //             SizedBox(
                  //               width: 10,
                  //             )
                  //           ],
                  //         ),
                  //       ),
                  //   ],
                  // ),
                  // ),