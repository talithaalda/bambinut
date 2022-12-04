import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:bambinut/providers/food.dart';

class Foods with ChangeNotifier {
  final List<Food> _foods = [
    Food(
        id: "1",
        title: "Bread",
        image: "https://cdn-icons-png.flaticon.com/512/2713/2713563.png",
        description: "ini bread",
        category: "vitamin",
        createdAt: DateTime.now()),
    Food(
        id: "2",
        title: "Beef",
        image: "https://cdn-icons-png.flaticon.com/512/3143/3143643.png",
        description: "ini daging",
        category: "vitamin",
        createdAt: DateTime.now()),
    Food(
        id: "3",
        title: "Apple",
        image: "https://cdn-icons-png.flaticon.com/512/415/415733.png",
        description: "ini apple",
        category: "vitamin",
        createdAt: DateTime.now()),
    Food(
        id: "4",
        title: "Apricot",
        image: "https://cdn-icons-png.flaticon.com/512/1135/1135558.png",
        description: "ini apricot",
        category: "vitamin",
        createdAt: DateTime.now()),
    Food(
        id: "5",
        title: "Banana",
        image: "https://cdn-icons-png.flaticon.com/512/831/831896.png",
        description: "ini banana",
        category: "vitamin",
        createdAt: DateTime.now()),
    Food(
        id: "6",
        title: "Broccoli",
        image: "https://cdn-icons-png.flaticon.com/512/2346/2346952.png",
        description: "ini broccoli",
        category: "vitamin",
        createdAt: DateTime.now()),
    Food(
        id: " 7",
        title: "Cherries",
        image: "https://cdn-icons-png.flaticon.com/512/135/135695.png",
        description: "ini cherries",
        category: "vitamin",
        createdAt: DateTime.now()),
    Food(
        id: " 8",
        title: "Chicken Leg",
        image: "https://cdn-icons-png.flaticon.com/512/8844/8844638.png",
        description: "ini chicken-leg",
        category: "vitamin",
        createdAt: DateTime.now()),
    Food(
        id: "9",
        title: "Kiwi",
        image: "https://cdn-icons-png.flaticon.com/512/4031/4031094.png",
        description: "ini kiwi",
        category: "vitamin",
        createdAt: DateTime.now()),
    Food(
        id: "10",
        title: "Mango",
        image: "https://cdn-icons-png.flaticon.com/512/3944/3944211.png",
        description: "ini mango",
        category: "vitamin",
        createdAt: DateTime.now()),
    Food(
        id: "11",
        title: "Milk",
        image: "https://cdn-icons-png.flaticon.com/512/869/869460.png",
        description: "ini milk",
        category: "vitamin",
        createdAt: DateTime.now()),
    Food(
        id: "12",
        title: "Noodles",
        image: "https://cdn-icons-png.flaticon.com/512/2718/2718224.png",
        description: "ini noodles",
        category: "Starch",
        createdAt: DateTime.now()),
    Food(
        id: "13",
        title: "Potato",
        image: "https://cdn-icons-png.flaticon.com/512/1652/1652077.png",
        description: "ini banana",
        category: "vitamin",
        createdAt: DateTime.now()),
    Food(
        id: "14",
        title: "Pumpkin",
        image: "https://cdn-icons-png.flaticon.com/512/3413/3413326.png",
        description: "ini pumpkin",
        category: "vitamin",
        createdAt: DateTime.now()),
    Food(
        id: "15",
        title: "Raspberry",
        image: "https://cdn-icons-png.flaticon.com/512/1515/1515032.png",
        description: "ini raspberry",
        category: "vitamin",
        createdAt: DateTime.now()),
    Food(
        id: "16",
        title: "Salmon",
        image: "https://cdn-icons-png.flaticon.com/512/4809/4809697.png",
        description: "ini salmon",
        category: "vitamin",
        createdAt: DateTime.now()),
    Food(
        id: "17",
        title: "Shrimp",
        image: "https://cdn-icons-png.flaticon.com/512/2970/2970030.png",
        description: "ini shrimp",
        category: "vitamin",
        createdAt: DateTime.now()),
    Food(
        id: "18",
        title: "Spinach",
        image: "https://cdn-icons-png.flaticon.com/512/2503/2503919.png",
        description: "ini spinach",
        category: "vitamin",
        createdAt: DateTime.now()),
    Food(
        id: "19",
        title: "Tofu",
        image: "https://cdn-icons-png.flaticon.com/512/2079/2079258.png",
        description: "ini tofu",
        category: "vitamin",
        createdAt: DateTime.now()),
    Food(
        id: "19",
        title: "Yogurt",
        image: "https://cdn-icons-png.flaticon.com/512/1047/1047510.png",
        description: "ini yogurt",
        category: "vitamin",
        createdAt: DateTime.now()),
  ];

  List<Food> get foods => _foods;

  int get jumlahFood => _foods.length;

  Food selectById(String id) =>
      _foods.firstWhere((element) => element.id == id);

  Food selectByName(String name) =>
      _foods.firstWhere((element) => element.title == name);

  Future<void> addFood(String title, String description, String category,
      String feedHist, String image) {
    DateTime datetimeNow = DateTime.now();

    Uri url = Uri.parse(
        "https://bambinut-df6a3-default-rtdb.firebaseio.com/Foods.json");
    return http
        .post(
      url,
      body: json.encode(
        {
          "title": title,
          "description": description,
          "imageUrl": image,
          "category": category,
          "feedHist": feedHist,
          "createdAt": datetimeNow.toString(),
        },
      ),
    )
        .then(
      (response) {
        print("THEN FUNCTION");
        _foods.add(
          Food(
            id: json.decode(response.body)["name"].toString(),
            title: title,
            description: description,
            image: image,
            category: category,
            createdAt: datetimeNow,
            feedHist: feedHist,
          ),
        );

        notifyListeners();
      },
    );
  }

  Future<void> editFood(String id, String title, String description,
      String image, String category, String feedHist) {
    Uri url = Uri.parse(
        "https://bambinut-df6a3-default-rtdb.firebaseio.com/Foods/$id.json");

    return http
        .patch(
      url,
      body: json.encode(
        {
          "title": title,
          "description": description,
          "imageUrl": image,
          "category": category,
          "feedHist": feedHist,
        },
      ),
    )
        .then(
      (response) {
        Food selectFood = _foods.firstWhere((element) => element.id == id);
        selectFood.title = title;
        selectFood.description = description;
        selectFood.image = image;
        selectFood.category = category;
        selectFood.feedHist = feedHist;
        notifyListeners();
      },
    );
  }

  Future<void> deleteFood(String id) {
    Uri url = Uri.parse(
        "https://bambinut-df6a3-default-rtdb.firebaseio.com/Foods/$id.json");
    return http.delete(url).then((response) {
      _foods.removeWhere((element) => element.id == id);
      notifyListeners();
    });
  }

  Future<void> initialData() async {
    Uri url = Uri.parse(
        "https://bambinut-df6a3-default-rtdb.firebaseio.com/Foods.json");

    var hasilGetData = await http.get(url);

    var dataResponse = json.decode(hasilGetData.body) as Map<String, dynamic>;
    print(dataResponse);

    dataResponse.forEach(
      (key, value) {
        DateTime dateTimeParse =
            DateFormat("yyyy-mm-dd hh:mm:ss").parse(value["createdAt"]);
        _foods.add(
          Food(
              id: key,
              title: value["title"],
              createdAt: dateTimeParse,
              image: value["imageUrl"],
              description: value["description"],
              category: value["category"],
              feedHist: value["feedHist"]),
        );
      },
    );
    print("SUCCESS ADDING FOOD");

    notifyListeners();
  }
}
