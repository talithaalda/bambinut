import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;

class insight extends StatefulWidget {
  @override
  State<insight> createState() => _insightState();
}

class _insightState extends State<insight> {
 List<charts.Series<dynamic, String>> seriesList= [];

  static List<charts.Series<Sales, String>> _createRandomData(){
    final random = Random();
    final desktopSalesData = [
      Sales('Apple', random.nextInt(100)),
      Sales('Avocado', random.nextInt(100)),
      Sales('Bread', random.nextInt(100)),
      Sales('Milk', random.nextInt(100)),
    ];
    return [charts.Series<Sales, String>(
      id: 'Sales',
      domainFn: (Sales sales, _) => sales.food,
      measureFn: (Sales sales, _) => sales.sales,
      data: desktopSalesData,
      fillColorFn: (Sales sales, _) {
        switch (sales.food) {
            case "Apple":
              {
                return charts.MaterialPalette.red.shadeDefault;
              }

            case "Bread":
              {
                return charts.MaterialPalette.red.shadeDefault;
              }

            default:
              {
                return charts.MaterialPalette.yellow.shadeDefault;
              }
          }
      },
    )];
  }


  @override
  void initState() {
    super.initState();
    seriesList = _createRandomData();
  }

  barChart(){
    return charts.BarChart(
      seriesList,
      animate:  true,
      vertical: false,
      defaultRenderer: new charts.BarRendererConfig(
      maxBarWidthPx: 100,)
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 135, 76, 98),
       appBar: AppBar(
          title: Center(child: Text("Insight")),
          automaticallyImplyLeading: false,
        ),
        body: ListView(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all( 
                Radius.circular(12)),
                color: Color.fromARGB(255, 167, 210, 203),
                ),
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.all(10.0),
              child: barChart(),
            ),
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all( 
                Radius.circular(12),),
                color: Color.fromARGB(255, 167, 210, 203),
                image: DecorationImage(image: AssetImage("assets/images/milk.jpg"), fit: BoxFit.cover,)
                ),
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text("Calcium",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 135, 76, 98))
                  ),
                  ),
            ),
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all( 
                Radius.circular(12)),
                color: Color.fromARGB(255, 167, 210, 203),
                ),
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text("Feeding Progress",
                    style: TextStyle(
                      fontSize: 20),textAlign: TextAlign.justify),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                    CircleAvatar(child: Text("1",style: TextStyle(fontSize: 25),),radius: 35,backgroundColor:Color.fromARGB(255, 135, 76, 98)),
                    CircleAvatar(child: Text("0",style: TextStyle(fontSize: 25)),radius: 35,backgroundColor:Color.fromARGB(255, 135, 76, 98)),
                    CircleAvatar(child: Text("0",style: TextStyle(fontSize: 25)),radius: 35,backgroundColor:Color.fromARGB(255, 135, 76, 98))
                  ],),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                    Text("  Tried"),
                    Text("      Trying"),
                    Text("  Watchlist")
                  ],)
                ],
              ),
            ),
          ],
        ),
    );
  }
}
class Sales{
  final String food;
  final int sales;

  Sales(this.food,this.sales);
}