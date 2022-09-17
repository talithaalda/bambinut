import 'dart:math';

import 'package:flutter/material.dart';
import 'package:testing/bottomnavigation.dart';
import 'package:testing/pages/list.dart';

class homepage extends StatelessWidget {
  static const nameRoute = '/homepage';
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Color.fromARGB(255, 154, 190, 224),
        appBar: AppBar(
          title: Center(child: Text("Food")),
        ),
        
        floatingActionButton: FloatingActionButton(
          onPressed:(){
            print("button add");
          },
          child: Icon(Icons.add
          ),
          ),
        body:
        GridView.count(
          padding: EdgeInsets.all(10),
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 4/4,
            children : [
            Rectangle(title: "Shrimp",image: "https://cdn-icons-png.flaticon.com/512/1680/1680475.png"),
            Rectangle(title: "Bread",image: "https://cdn-icons-png.flaticon.com/512/883/883561.png"),
            Rectangle(title: "Banana",image: "https://cdn-icons-png.flaticon.com/512/3143/3143645.png"),
            Rectangle(title: "Egg",image: "https://cdn-icons-png.flaticon.com/512/837/837560.png"),
            Rectangle(title: "Egg",image: "https://cdn-icons-png.flaticon.com/512/837/837560.png"),
            Rectangle(title: "Egg",image: "https://cdn-icons-png.flaticon.com/512/837/837560.png"),
            Rectangle(title: "Egg",image: "https://cdn-icons-png.flaticon.com/512/837/837560.png"),
            Rectangle(title: "Egg",image: "https://cdn-icons-png.flaticon.com/512/837/837560.png"),
            Rectangle(title: "Egg",image: "https://cdn-icons-png.flaticon.com/512/837/837560.png"),
            Rectangle(title: "Egg",image: "https://cdn-icons-png.flaticon.com/512/837/837560.png"),
            Rectangle(title: "Egg",image: "https://cdn-icons-png.flaticon.com/512/837/837560.png"),
            Rectangle(title: "Egg",image: "https://cdn-icons-png.flaticon.com/512/837/837560.png"),
            Rectangle(title: "Egg",image: "https://cdn-icons-png.flaticon.com/512/837/837560.png"),
            Rectangle(title: "Egg",image: "https://cdn-icons-png.flaticon.com/512/837/837560.png"),
            Rectangle(title: "Egg",image: "https://cdn-icons-png.flaticon.com/512/837/837560.png"),
            Rectangle(title: "Egg",image: "https://cdn-icons-png.flaticon.com/512/837/837560.png"),
            Rectangle(title: "Egg",image: "https://cdn-icons-png.flaticon.com/512/837/837560.png"),
            Rectangle(title: "Egg",image: "https://cdn-icons-png.flaticon.com/512/837/837560.png"),
            Rectangle(title: "Egg",image: "https://cdn-icons-png.flaticon.com/512/837/837560.png"),
            ],
        ),
      );
  }
}

class Rectangle extends StatelessWidget {
  final String title;
  final String image;

  Rectangle({required this.title,required this.image}); 

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Color.fromARGB(255, 140, 108, 227),
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
                      image: NetworkImage(image),
                    )
                  ),
                ),
                Positioned(
                  top: 80,
                  child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 223, 204, 144),
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
              ]
      ),
      ),
    );
  }
}
