import 'package:flutter/material.dart';
import 'package:testing/widget/theme.dart';

class category_detail extends StatelessWidget {
    static const nameRoute = '/catrgorydetail';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greentosca,
      appBar: AppBar(title: Text("Nama Category")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(category_detail.nameRoute);
              },
              child: Container(
                margin: const EdgeInsets.all(8.0),
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Color.fromARGB(255, 242, 211, 136),
                  border: Border.all(color: darkchoco),
                ),
                child: Center(
                  child: ListTile(
                    title: Text(
                      "Broccoli",
                      style: TextStyle(color: darkchoco),
                    ),
                    leading: Image(image: AssetImage("assets/images/broccoli.png"),width: 30),
                    trailing: Image(image: AssetImage("assets/images/x.png"),width: 30,color: Color.fromARGB(255, 167, 13, 2),),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(category_detail.nameRoute);
              },
              child: Container(
                margin: const EdgeInsets.all(8.0),
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Color.fromARGB(255, 242, 211, 136),
                  border: Border.all(color: darkchoco),
                ),
                child: Center(
                  child: ListTile(
                    title: Text(
                      "Banana",
                      style: TextStyle(color: darkchoco),
                    ),
                    leading: Image(image: AssetImage("assets/images/banana.png"),width: 30),
                    trailing: Image(image: AssetImage("assets/images/x.png"),width: 30,color: Color.fromARGB(255, 167, 13, 2),),
                  ),
                ),
              ),
            ),GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(category_detail.nameRoute);
              },
              child: Container(
                margin: const EdgeInsets.all(8.0),
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Color.fromARGB(255, 242, 211, 136),
                  border: Border.all(color: darkchoco),
                ),
                child: Center(
                  child: ListTile(
                    title: Text(
                      "Apple",
                      style: TextStyle(color: darkchoco),
                    ),
                    leading: Image(image: AssetImage("assets/images/apple.png"),width: 30),
                    trailing: Image(image: AssetImage("assets/images/x.png"),width: 30,color: Color.fromARGB(255, 167, 13, 2),),
                  ),
                ),
              ),
            ),GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(category_detail.nameRoute);
              },
              child: Container(
                margin: const EdgeInsets.all(8.0),
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Color.fromARGB(255, 242, 211, 136),
                  border: Border.all(color: darkchoco),
                ),
                child: Center(
                  child: ListTile(
                    title: Text(
                      "Milk",
                      style: TextStyle(color: darkchoco),
                    ),
                    leading: Image(image: AssetImage("assets/images/milk.png"),width: 30),
                    trailing: Image(image: AssetImage("assets/images/x.png"),width: 30,color: Color.fromARGB(255, 167, 13, 2),),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}