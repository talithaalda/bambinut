import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:bambinut/widget/theme.dart';
import 'package:intl/intl.dart';

class createmeal extends StatefulWidget {
  static const nameRoute = '/createmeal';

  @override
  State<createmeal> createState() => _createmealState();
}

class _createmealState extends State<createmeal> {
  TextEditingController date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greentosca,
      appBar: AppBar(
        title: Text("Create a new meal",
            style: TextStyle(
                fontWeight: FontWeight.w100, fontSize: 19, color: darkchoco)),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 167, 210, 203),
        elevation: 0,
        iconTheme: IconThemeData(color: darkchoco),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          children: [
            DottedBorder(
              borderType: BorderType.RRect,
              color: Color.fromARGB(255, 129, 128, 128),
              radius: Radius.circular(10),
              strokeWidth: 2,
              dashPattern: [10, 6],
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                height: 42,
                width: 320,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color.fromARGB(255, 242, 211, 136),
                ),
                child: TextField(
                  controller: date,
                  style: TextStyle(color: darkchoco),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    label: Text("Select Date"),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    prefixIcon: Icon(Icons.calendar_today,
                        color: Color.fromARGB(255, 102, 56, 16)),
                  ),
                  readOnly: true,
                  onTap: () async {
                    DateTime newDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100));

                    if (newDate != null) {
                      print(
                          newDate); //newDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                          DateFormat.yMMMMd('en_US').format(newDate);
                      print(
                          formattedDate); //formatted date output using intl package =>  2021-03-16
                      //you can implement different kind of Date Format here according to your requirement

                      setState(() {
                        date.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {
                      print("Date is not selected");
                    }
                  },
                ),
              ),
            ),
            SizedBox(
              height: 37,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    border: Border.all(color: darkchoco),
                    color: yellowpale,
                  ),
                  child: Text(
                    "Breakfast",
                    style: TextStyle(fontSize: 11),
                  ),
                ),
                SizedBox(width: 11),
                Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    border: Border.all(color: darkchoco),
                    color: yellowpale,
                  ),
                  child: Text(
                    "Lunch",
                    style: TextStyle(fontSize: 11),
                  ),
                ),
                SizedBox(width: 11),
                Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    border: Border.all(color: darkchoco),
                    color: yellowpale,
                  ),
                  child: Text(
                    "Dinner",
                    style: TextStyle(fontSize: 11),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 37,
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, top: 5),
              height: 150,
              width: 320,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color.fromARGB(255, 242, 211, 136),
                  border: Border.all(color: darkchoco)),
              child: Center(
                child: Text(
                  "+ Add Ingredients",
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: darkchoco,
                      fontSize: 16),
                ),
              ),
            ),
            SizedBox(height: 37),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                    image: AssetImage("assets/images/happy.png"),
                    width: 52,
                    height: 52),
                SizedBox(width: 26),
                Image(
                    image: AssetImage("assets/images/straight.png"),
                    width: 52,
                    height: 52),
                SizedBox(width: 26),
                Image(
                    image: AssetImage("assets/images/sad.png"),
                    width: 52,
                    height: 52),
              ],
            ),
            SizedBox(height: 44),
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
    );
  }
}
