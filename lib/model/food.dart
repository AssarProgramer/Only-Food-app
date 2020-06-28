import 'package:flutter/material.dart';

class Food {
  final String foodName;
  final String foodType;
  final double foodPrice;
  final double foodRating;
  final String foodImage;

  Food({
    @required this.foodImage,
    @required this.foodName,
    @required this.foodPrice,
    @required this.foodType,
    @required this.foodRating,
  });
}
