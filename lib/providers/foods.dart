import 'package:flutter/foundation.dart';
import 'package:testing/providers/food.dart';

class Foods with ChangeNotifier {
  final List<Food> foods = [
      Food(
        id: 1,
        title: "Bread",
        image:"assets/images/bread.png",
        description:"ini roti" 
      ),
      Food(
        id: 2,
        title: "Beef",
        image:"assets/images/beef.png",
        description:"ini daging" 
      ),
      Food(
        id: 3,
        title: "Apple",
        image:"assets/images/apple.png",
        description:"ini apple" 
      ),
    ];
    Food findbyName(foodName){
      return foods.firstWhere((title) => title.title == foodName);
    }
}