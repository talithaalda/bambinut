import 'package:flutter/foundation.dart';
class Food with ChangeNotifier{
  final int id;
  final String title;
  final String image;
  final String description;


  Food({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
  });
}