import 'package:flutter/foundation.dart';

class Food {
  String id;
  String title;
  String image;
  String description;
  String category;
  String feedHist;
  String foodId;
  DateTime createdAt;

  Food(
      {this.id,
      this.foodId = '',
      this.title,
      this.image,
      this.description,
      this.category,
      this.feedHist = '',
      this.createdAt});
}
