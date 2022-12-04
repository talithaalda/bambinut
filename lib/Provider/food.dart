import 'package:flutter/foundation.dart';

class Food  {
   String id;
   String title;
   String image;
   String description;
   String category;
   String feedHist;
   DateTime createdAt;

  Food(
      {required this.id,required this.title,
       required this.image,
       required this.description,
       required this.category,
       this.feedHist = '',
       required this.createdAt});
}
