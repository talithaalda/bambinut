import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:http/http.dart' as http;

class HttpFood  {
  final int id;
  final String title;
  final String image;
  final String description;
  final List keyNutri;

  HttpFood({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    required this.keyNutri,
  });
}

