import 'package:flutter/material.dart';

@immutable
class User {
  final String name;
  final int age, rating;
  final String token, title;

  const User({
    required this.name,
    required this.age,
    required this.token,
    required this.title,
    required this.rating,
  });
}
