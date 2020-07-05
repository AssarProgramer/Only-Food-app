import 'package:flutter/material.dart';

class User {
  final String fullName;
  final String email;
  final int phoneNumber;
  final String imagePath;
  final String gender;
  final String address;
  final String myImage;

  User({
    @required this.imagePath,
    @required this.email,
    @required this.fullName,
    @required this.phoneNumber,
    @required this.address,
    @required this.gender,
    @required this.myImage,
  });
}
