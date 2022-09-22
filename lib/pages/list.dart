import 'package:flutter/material.dart';
import 'package:testing/bottomnavigation.dart';
import 'package:testing/pages/home.dart';


class listpage extends StatelessWidget {
  static const nameRoute = '/listpage';
  @override
  Widget build(BuildContext context) {
    
      return Scaffold(
        backgroundColor: Color.fromARGB(255, 135, 76, 98),
        // appBar: AppBar(
        // centerTitle: true,
        //   title: Text("List"),
        // ),
        floatingActionButton: FloatingActionButton(
          onPressed:(){
            print("button add");
          },
          child: Icon(Icons.add,color: Colors.black,
          ),
          backgroundColor: Color.fromARGB(255, 242, 211, 136),
          ),
        body: 
        
        ListView(
          children: [
            Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all( 
                Radius.circular(12)),
                color: Color.fromARGB(255, 242, 211, 136),
                ),
              child: ListTile(
                contentPadding: EdgeInsets.all(10),
                title: Text("To Try"),
                subtitle: Text("What your baby going to try"),
                leading: Icon(Icons.star_border_purple500_rounded),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all( 
                Radius.circular(12)),
                color: Color.fromARGB(255, 242, 211, 136),
                ),
              child: ListTile(
                contentPadding: EdgeInsets.all(10),
                title: Text("Tried"),
                subtitle: Text("Finally your baby liked it!"),
                leading: Icon(Icons.check_circle_outline),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all( 
                Radius.circular(12)),
                color: Color.fromARGB(255, 242, 211, 136),
                ),
              child: ListTile(
                contentPadding: EdgeInsets.all(10),
                title: Text("Tring"),
                subtitle: Text("Refused? Do not give up yet"),
                leading: Icon(Icons.line_weight_outlined),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all( 
                Radius.circular(12)),
                color: Color.fromARGB(255, 242, 211, 136),
                ),
              child: ListTile(
                contentPadding: EdgeInsets.all(10),
                title: Text("Watchlist"),
                subtitle: Text("See a rash? Do not panic and keep monitoring"),
                leading: Icon(Icons.warning_amber),
              ),
            ),
          ], 
        ),
        );
  }
}