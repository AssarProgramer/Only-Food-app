import 'dart:io';

import 'package:flutter/material.dart';

class User {
  final String fullName;
  final String email;
  final int phoneNumber;

  final String gender;
  final String address;
  final File myImage;

  User({
    @required this.email,
    @required this.fullName,
    @required this.phoneNumber,
    @required this.address,
    @required this.gender,
    @required this.myImage,
  });
}
