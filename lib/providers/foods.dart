import 'package:flutter/foundation.dart';
import 'package:testing/providers/food.dart';

class Foods with ChangeNotifier {
  final List<Food> foods = [
      Food(
        id: 1,
        title: "Bread",
        keyNutri : ["Starch"],
        image:"assets/images/bread.png",
        description:"ini roti" 
      ),
      Food(
        id: 2,
        title: "Beef",
        image:"assets/images/beef.png",
        description:"ini daging" ,
        keyNutri : ["Vitamin C","Protein","Iron","Zinc","Vitamin B12"],

      ),
      Food(
        id: 3,
        title: "Apple",
        image:"assets/images/apple.png",
        description:"ini apple",
        keyNutri : ["Vitamin C","Fiber"],
      ),
      Food(
        id: 4,
        title: "Apricot",
        image:"assets/images/apricot.png",
        description:"ini apricot" ,
        keyNutri : ["Vitamin A","Vitamin C","Fiber"],
      ),
      Food(
        id: 5,
        title: "Banana",
        image:"assets/images/banana.png",
        description:"ini banana" ,
        keyNutri : ["Vitamin C","Fiber"],

      ),
      Food(
        id: 6,
        title: "Broccoli",
        image:"assets/images/broccoli.png",
        description:"ini broccoli" ,
        keyNutri : ["Vitamin C"],
      ),
      Food(
        id: 7,
        title: "Cherries",
        image:"assets/images/cherries.png",
        description:"ini cherries" ,
        keyNutri : ["Vitamin C","Fiber"],
      ),
      Food(
        id: 8,
        title: "Chicken Leg",
        image:"assets/images/chickenleg.png",
        description:"ini chicken-leg",
        keyNutri : ["Protein","Iron","Zinc","Vitamin B12","Riboflavin","Lipids"],
      ),
      Food(
        id: 9,
        title: "Kiwi",
        image:"assets/images/kiwi.png",
        description:"ini kiwi",
        keyNutri : ["Vitamin C","Vitamin E","Fiber"],
      ),
      Food(
        id: 10,
        title: "Mango",
        image:"assets/images/mango.png",
        description:"ini mango",
        keyNutri : ["Vitamin A","Vitamin C","Vitamin E"],
      ),
      Food(
        id: 11,
        title: "Milk",
        image:"assets/images/milk.png",
        description:"ini milk",
        keyNutri : ["Calcium","Zinc","Vitamin D","Vitamin B12","Riboflavin","Protein","Vitamin A"],
      ),
      Food(
        id: 12,
        title: "Noodles",
        image:"assets/images/noodles.png",
        description:"ini noodles",
        keyNutri : ["Starch"],
      ),
      Food(
        id: 13,
        title: "Potato",
        image:"assets/images/potato.png",
        description:"ini banana",
        keyNutri : ["Vitamin C","Folate","Starch","Fiber"],
      ),
      Food(
        id: 14,
        title: "Pumpkin",
        image:"assets/images/pumpkin.png",
        description:"ini pumpkin",
        keyNutri : ["Vitamin C"],
      ),
      Food(
        id: 15,
        title: "Raspberry",
        image:"assets/images/raspberry.png",
        description:"ini raspberry",
        keyNutri : ["Vitamin C","Vitamin E","Fiber"],
      ),
      Food(
        id: 16,
        title: "Salmon",
        image:"assets/images/salmon.png",
        description:"ini salmon",
        keyNutri : ["Vitamin C","Vitamin A"],
      ),
      Food(
        id: 17,
        title: "Shrimp",
        image:"assets/images/shrimp.png",
        description:"ini shrimp",
        keyNutri : ["Vitamin B12","Protein","Zinc","Omega 3","Iron"],
      ),
      Food(
        id: 18,
        title: "Spinach",
        image:"assets/images/spinach.png",
        description:"ini spinach",
        keyNutri : ["Vitamin A","Vitamin E","Vitamin C","Riboflavin","Folate"],
      ),
      Food(
        id: 19,
        title: "Tofu",
        image:"assets/images/tofu.png",
        description:"ini tofu",
        keyNutri : ["Calcium","Iron","Zinc","Protein","Omega 3"],
      ),
      Food(
        id: 20,
        title: "Yogurt",
        image:"assets/images/yogurt.png",
        description:"ini yogurt",
        keyNutri : ["Calcium","Zinc","Protein","Vitamin B12","Riboflavin","Lipids"],
      ),
    ];
    Food findbyName(foodName){
      return foods.firstWhere((title) => title.title == foodName);
    }
}