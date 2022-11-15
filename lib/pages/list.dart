import 'package:flutter/material.dart';
import 'package:bambinut/pages/category_detail.dart';
import 'package:bambinut/pages/home.dart';
import 'package:bambinut/widget/theme.dart';

class listpage extends StatelessWidget {
  static const nameRoute = '/listpage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greentosca,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Category"),
      ),
      
      body: Padding(
        padding: const EdgeInsets.only(top:18),
        child: ListView(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(category_detail.nameRoute);
              },
              child: Container(
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: Color.fromARGB(255, 242, 211, 136),
                  border: Border.all(color: darkchoco),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.all(10),
                  title: Text(
                    "To Try",
                    style: TextStyle(color: darkchoco),
                  ),
                  subtitle: Text("What your baby going to try"),
                  leading: Icon(Icons.star_border_purple500_rounded),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(category_detail.nameRoute);
              },
              child: Container(
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: Color.fromARGB(255, 242, 211, 136),
                  border: Border.all(color: darkchoco),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.all(10),
                  title: Text(
                    "Tried",
                    style: TextStyle(color: darkchoco),
                  ),
                  subtitle: Text("Finally your baby liked it!"),
                  leading: Icon(Icons.check_circle_outline),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(category_detail.nameRoute);
              },
              child: Container(
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: Color.fromARGB(255, 242, 211, 136),
                  border: Border.all(color: darkchoco),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.all(10),
                  title: Text(
                    "Tring",
                    style: TextStyle(color: darkchoco),
                  ),
                  subtitle: Text("Refused? Do not give up yet"),
                  leading: Icon(Icons.line_weight_outlined),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(category_detail.nameRoute);
              },
              child: Container(
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: Color.fromARGB(255, 242, 211, 136),
                  border: Border.all(color: darkchoco),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.all(10),
                  title: Text(
                    "Watchlist",
                    style: TextStyle(color: darkchoco),
                  ),
                  subtitle: Text("See a rash? Do not panic and keep monitoring"),
                  leading: Icon(Icons.warning_amber),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
