import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("My Apps"),
        ),
        body: const Center(
          child: Text("HALLO00000000000000ssssssssssssssssssssssssssssssssssssssssssssssoooooooooooooooooooooooooooooooooooooooooooooooo0000000000000000000000000000000000000000000000000000OO",
          // maxLines: 2,
          //overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(
            backgroundColor: Colors.amber,
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            letterSpacing: 10,
            fontFamily: 'Blueberry',
            decorationStyle: TextDecorationStyle.wavy,
            decoration: TextDecoration.lineThrough,
            decorationColor: Colors.white
          ),
          )
        ),
      ),
    );
  }
}

