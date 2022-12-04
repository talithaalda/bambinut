import 'package:flutter/material.dart';
import 'package:bambinut/pages/createfood.dart';
import 'package:bambinut/pages/food_detail.dart';
import 'package:bambinut/pages/list.dart';
import 'package:provider/provider.dart';
import 'package:bambinut/providers/food.dart';
import 'package:bambinut/providers/foods.dart';
import 'package:bambinut/pages/menu.dart';

class homepage extends StatefulWidget {
  static const nameRoute = '/homepage';

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  bool isInit = true;
  int selectedFood = 0;
  bool navbottom = menu.navbottom;

  @override
  void didChangeDependencies() {
    if (navbottom == false) {
      if (isInit) {
        Provider.of<Foods>(context).initialData();
      }
      isInit = false;
      super.didChangeDependencies();
    }
  }

  @override
  void dispose() {
    isInit = true;
    super.dispose();
  }

  List<Tab> myTab = [
    Tab(
        child: Container(
      height: 50,
      padding: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border:
              Border.all(color: Color.fromARGB(255, 135, 76, 98), width: 1)),
      child: Align(
          alignment: Alignment.center,
          child: Text(
            'All',
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
    )),
    Tab(
        child: Container(
      height: 50,
      padding: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border:
              Border.all(color: Color.fromARGB(255, 135, 76, 98), width: 1)),
      child: Align(
          alignment: Alignment.center,
          child: Text('6M+', style: TextStyle(fontWeight: FontWeight.bold))),
    )),
    Tab(
        child: Container(
      height: 50,
      padding: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border:
              Border.all(color: Color.fromARGB(255, 135, 76, 98), width: 1)),
      child: Align(
          alignment: Alignment.center,
          child: Text('9M+', style: TextStyle(fontWeight: FontWeight.bold))),
    )),
    Tab(
        child: Container(
      height: 50,
      padding: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border:
              Border.all(color: Color.fromARGB(255, 135, 76, 98), width: 1)),
      child: Align(
          alignment: Alignment.center,
          child: Text('12M+', style: TextStyle(fontWeight: FontWeight.bold))),
    )),
  ];

  @override
  Widget build(BuildContext context) {
    // final foodData = Provider.of<food>(context);
    // final allfood = foodData.allFoods;
    final foodsProvider = Provider.of<Foods>(context, listen: false);

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
            tabs: myTab,
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     Navigator.of(context).pushNamed(createFood.nameRoute);
        //   },
        //   child: Icon(
        //     Icons.add,
        //     color: Colors.black,
        //   ),
        //   backgroundColor: Color.fromARGB(255, 242, 211, 136),
        // ),
        body: TabBarView(
          children: [
            GridView.builder(
              padding: EdgeInsets.all(10),
              itemCount: foodsProvider.jumlahFood,
              itemBuilder: (ctx, i) {
                return foodItem(
                    title: foodsProvider.foods[i].title,
                    image: foodsProvider.foods[i].image);
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 4 / 4,
              ),
            ),
            GridView.count(
              padding: EdgeInsets.all(10),
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 4 / 4,
              children: [
                foodItem(title: "Apricot", image: "assets/images/apricot.png"),
                foodItem(title: "Beef", image: "assets/images/beef.png"),
                foodItem(title: "Apple", image: "assets/images/apple.png"),
                foodItem(title: "Banana", image: "assets/images/banana.png"),
                foodItem(
                    title: "Broccoli", image: "assets/images/broccoli.png"),
                foodItem(
                    title: "Chicken Leg",
                    image: "assets/images/chickenleg.png"),
                foodItem(title: "Potato", image: "assets/images/potato.png"),
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
                foodItem(title: "Apple", image: "assets/images/apple.png"),
                foodItem(title: "Apricot", image: "assets/images/apricot.png"),
                foodItem(title: "Banana", image: "assets/images/banana.png"),
                foodItem(
                    title: "Broccoli", image: "assets/images/broccoli.png"),
                foodItem(
                    title: "Cherries", image: "assets/images/cherries.png"),
                foodItem(
                    title: "Chicken Leg",
                    image: "assets/images/chickenleg.png"),
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
                foodItem(
                    title: "Broccoli", image: "assets/images/broccoli.png"),
                foodItem(
                    title: "Cherries", image: "assets/images/cherries.png"),
                foodItem(
                    title: "Chicken Leg",
                    image: "assets/images/chickenleg.png"),
                foodItem(title: "Kiwi", image: "assets/images/kiwi.png"),
                foodItem(title: "Milk", image: "assets/images/milk.png"),
                foodItem(title: "Mango", image: "assets/images/mango.png"),
                foodItem(title: "Noodles", image: "assets/images/noodles.png"),
                foodItem(title: "Potato", image: "assets/images/potato.png"),
                foodItem(title: "Salmon", image: "assets/images/salmon.png"),
                foodItem(title: "Tofu", image: "assets/images/tofu.png"),
                foodItem(title: "Yogurt", image: "assets/images/yogurt.png"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class foodItem extends StatefulWidget {
  final String title;
  final String image;

  foodItem({required this.title, required this.image});

  @override
  State<foodItem> createState() => _foodItemState();
}

class _foodItemState extends State<foodItem> {
  @override
  Widget build(BuildContext context) {
    final foodsClass = Provider.of<Foods>(context);
    final foodsProvider = foodsClass.selectByName(widget.title);
    int selectedFood = -1;

    return GestureDetector(
      onTap: () {
        // setState(() {
        //   selectedFood = 1;
        // });
        Navigator.of(context)
            .pushNamed(food_detail.nameRoute, arguments: foodsProvider.id);
      },
      child: Container(
        child: Card(
          color: Color.fromARGB(255, 135, 76, 98),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(children: [
            Container(
              height: 70,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(widget.image),
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 242, 211, 136),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )),
                height: 30,
                width: 110,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          child: Center(
                              child: selectedFood == 1
                                  ? Icon(
                                      Icons.check,
                                      size: 10,
                                      color: Colors.black,
                                    )
                                  : null),
                          height: 13,
                          width: 13,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          )),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        widget.title,
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
