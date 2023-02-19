import 'package:flutter/cupertino.dart';

class User {
  final String name;
  final String greekAffil;
  final String major;
  final String age;
  final String imgUrl;
  final String gradYear;
  final String bio;
  final String phoneNumber;
  bool isLiked;
  bool isSwipedOff;

  User({
    required this.greekAffil,
    required this.major,
    required this.name,
    required this.age,
    required this.imgUrl,
    required this.gradYear,
    required this.bio,
    required this.phoneNumber,
    this.isLiked = false,
    this.isSwipedOff = false,
  });
}
