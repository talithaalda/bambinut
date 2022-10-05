import 'dart:math';
import 'package:flutter/material.dart';
import 'package:testing/bottomnavigation.dart';
import 'package:testing/pages/food_detail.dart';
import 'package:testing/pages/list.dart';
import 'package:provider/provider.dart';
import 'package:testing/providers/food.dart'; 
import 'package:testing/providers/foods.dart';

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
    // final foodData = Provider.of<food>(context);
    // final allfood = foodData.allFoods;
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
        body: TabBarView(
          children: [
            GridView.count(
            padding: EdgeInsets.all(10),
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 4 / 4,
            children: [
              foodItem(title: "Shrimp", image: "assets/images/shrimp.png"),
              foodItem(title: "Bread", image: "assets/images/bread.png"),
              foodItem(title: "Beef", image: "assets/images/beef.png"),
              foodItem(title: "Apple", image: "assets/images/apple.png"),
              foodItem(title: "Apricot", image: "assets/images/apricot.png"),
              foodItem(title: "Banana", image: "assets/images/banana.png"),
              foodItem(title: "Broccoli", image: "assets/images/broccoli.png"),
              foodItem(title: "Cherries", image: "assets/images/cherries.png"),
              foodItem(title: "Chicken Leg", image: "assets/images/chicken-leg.png"),
              foodItem(title: "Kiwi", image: "assets/images/kiwi.png"),
              foodItem(title: "Milk", image: "assets/images/milk.png"),
              foodItem(title: "Mango", image: "assets/images/mango.png"),
              foodItem(title: "Noodles", image: "assets/images/noodles.png"),
              foodItem(title: "Potato", image: "assets/images/potato.png"),
              foodItem(title: "Pumpkin", image: "assets/images/pumpkin.png"),
              foodItem(title: "Raspberry", image: "assets/images/raspberry.png"),
              foodItem(title: "Salmon", image: "assets/images/salmon.png"),
              foodItem(title: "Spinach", image: "assets/images/spinach.png"),
              foodItem(title: "Tofu", image: "assets/images/tofu.png"),
              foodItem(title: "Yogurt", image: "assets/images/yogurt.png"),
            ],
          ),
          GridView.builder(
            padding: EdgeInsets.all(10),
            itemCount: Foods().foods.length,
            itemBuilder: (ctx, i) => foodItem(
              title :Foods().foods[i].title,
              image: Foods().foods[i].image),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 4 / 4,
            ),
            
            // children: [
            //   Rectangle(title: "Apricot", image: "assets/images/apricot.png"),
            //   Rectangle(title: "Beef", image: "assets/images/beef.png"),
            //   Rectangle(title: "Apple", image: "assets/images/apple.png"),
            //   Rectangle(title: "Banana", image: "assets/images/banana.png"),
            //   Rectangle(title: "Broccoli", image: "assets/images/broccoli.png"),
            //   Rectangle(title: "Chicken Leg", image: "assets/images/chicken-leg.png"),
            //   Rectangle(title: "Potato", image: "assets/images/potato.png"),
            // ],
          ),
          GridView.count(
            padding: EdgeInsets.all(10),
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 4 / 4,
            children: [
              foodItem(title: "Bread", image: "assets/images/bread.png"),
              foodItem(title: "Apple", image: "assets/images/apple.png"),
              foodItem(title: "Apricot", image: "assets/images/apricot.png"),
              foodItem(title: "Banana", image: "assets/images/banana.png"),
              foodItem(title: "Broccoli", image: "assets/images/broccoli.png"),
              foodItem(title: "Cherries", image: "assets/images/cherries.png"),
              foodItem(title: "Chicken Leg", image: "assets/images/chicken-leg.png"),
              foodItem(title: "Milk", image: "assets/images/milk.png"),
              foodItem(title: "Mango", image: "assets/images/mango.png"),
              foodItem(title: "Potato", image: "assets/images/potato.png"),
              foodItem(title: "Pumpkin", image: "assets/images/pumpkin.png"),
              foodItem(title: "Salmon", image: "assets/images/salmon.png"),
              foodItem(title: "Spinach", image: "assets/images/spinach.png"),
              foodItem(title: "Yogurt", image: "assets/images/yogurt.png"),
            ],
          ),
          GridView.count(
            padding: EdgeInsets.all(10),
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 4 / 4,
            children: [
              foodItem(title: "Bread", image: "assets/images/bread.png"),
              foodItem(title: "Beef", image: "assets/images/beef.png"),
              foodItem(title: "Apple", image: "assets/images/apple.png"),
              foodItem(title: "Apricot", image: "assets/images/apricot.png"),
              foodItem(title: "Broccoli", image: "assets/images/broccoli.png"),
              foodItem(title: "Cherries", image: "assets/images/cherries.png"),
              foodItem(title: "Chicken Leg", image: "assets/images/chicken-leg.png"),
              foodItem(title: "Kiwi", image: "assets/images/kiwi.png"),
              foodItem(title: "Milk", image: "assets/images/milk.png"),
              foodItem(title: "Mango", image: "assets/images/mango.png"),
              foodItem(title: "Noodles", image: "assets/images/noodles.png"),
              foodItem(title: "Potato", image: "assets/images/potato.png"),
              foodItem(title: "Salmon", image: "assets/images/salmon.png"),
              foodItem(title: "Tofu", image: "assets/images/tofu.png"),
              foodItem(title: "Yogurt", image: "assets/images/yogurt.png"),
            ],
          ),],
          
        ),
      ),
    );
  }
}

class foodItem extends StatelessWidget {
  final String title;
  final String image;

  foodItem({required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(food_detail.nameRoute,
        arguments: title);
        
      },
      child: Container(
        child: Card(
          color: Color.fromARGB(255, 135, 76, 98),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
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
      ),
    );
  }
}
