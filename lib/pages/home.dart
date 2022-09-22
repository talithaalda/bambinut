import 'dart:math';

import 'package:flutter/material.dart';
import 'package:testing/bottomnavigation.dart';
import 'package:testing/pages/list.dart';

class homepage extends StatelessWidget {
  static const nameRoute = '/homepage';
  List<Tab> myTab1 = [
    Tab(
      child: Container(
        height: 50,
        padding: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: Color.fromARGB(255, 135, 76, 98), width: 1)),
        child: Align(
            alignment: Alignment.center,
            child: Text('All')),
      )),
    Tab(
      child: Container(
        height: 50,
        padding: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: Color.fromARGB(255, 135, 76, 98), width: 1)),
        child: Align(
            alignment: Alignment.center,
            child: Text('6M+')),
      )),
    Tab(
      child: Container(
        height: 50,
        padding: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: Color.fromARGB(255, 135, 76, 98), width: 1)),
        child: Align(
            alignment: Alignment.center,
            child: Text('9M+')),
      )),
    Tab(
      child: Container(
        height: 50,
        padding: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: Color.fromARGB(255, 135, 76, 98), width: 1)),
        child: Align(
            alignment: Alignment.center,
            child: Text('12M+')),
      )),
  ];
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 167, 210, 203),
        appBar: AppBar(
          // title: Center(child: Text("Home")),
          automaticallyImplyLeading: false,
          title: TabBar(
            isScrollable: false,
            indicatorWeight: 0,
              unselectedLabelColor: Color.fromARGB(255, 135, 76, 98),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color.fromARGB(255, 135, 76, 98),
              ),
              labelPadding: EdgeInsets.all(3),
              indicatorSize: TabBarIndicatorSize.label,
            tabs: myTab1,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("button add");
          },
          child: Icon(
            Icons.add,
            color: Colors.black,
          ),
          backgroundColor: Color.fromARGB(255, 242, 211, 136),
        ),
        body: GridView.count(
          padding: EdgeInsets.all(10),
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 4 / 4,
          children: [
            Rectangle(title: "Shrimp", image: "assets/images/shrimp.png"),
            Rectangle(title: "Bread", image: "assets/images/bread.png"),
            Rectangle(title: "Beef", image: "assets/images/beef.png"),
            Rectangle(title: "Apple", image: "assets/images/apple.png"),
            Rectangle(title: "Apricot", image: "assets/images/apricot.png"),
            Rectangle(title: "Banana", image: "assets/images/banana.png"),
            Rectangle(title: "Broccoli", image: "assets/images/broccoli.png"),
            Rectangle(title: "Cherries", image: "assets/images/cherries.png"),
            Rectangle(title: "Chicken Leg", image: "assets/images/chicken-leg.png"),
            Rectangle(title: "Kiwi", image: "assets/images/kiwi.png"),
            Rectangle(title: "Milk", image: "assets/images/milk.png"),
            Rectangle(title: "Mango", image: "assets/images/mango.png"),
            Rectangle(title: "Noodles", image: "assets/images/noodles.png"),
            Rectangle(title: "Potato", image: "assets/images/potato.png"),
            Rectangle(title: "Pumpkin", image: "assets/images/pumpkin.png"),
            Rectangle(title: "Raspberry", image: "assets/images/raspberry.png"),
            Rectangle(title: "Salmon", image: "assets/images/salmon.png"),
            Rectangle(title: "Spinach", image: "assets/images/spinach.png"),
            Rectangle(title: "Tofu", image: "assets/images/tofu.png"),
            Rectangle(title: "Yogurt", image: "assets/images/yogurt.png"),
          ],
        ),
      ),
    );
  }
}

class Rectangle extends StatelessWidget {
  final String title;
  final String image;

  Rectangle({required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Color.fromARGB(255, 135, 76, 98),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
            // crossAxisAlignment: CrossAxisAlignment.end,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 70,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(image),
                )),
              ),
              Positioned(
                top: 80,
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 242, 211, 136),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      )),
                  height: 30,
                  width: 110,
                  child: Center(
                    child: Text(title),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
