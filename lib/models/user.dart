import 'package:flutter/material.dart';

@immutable
class UserProfile {
  final String name;
  final int age, rating;
  final String token, title;

  const UserProfile({
    required this.name,
    required this.age,
    required this.token,
    required this.title,
    required this.rating,
  });
}
