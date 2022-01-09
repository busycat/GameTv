import 'package:flutter/material.dart';

@immutable
class UserProfile {
  final String name, id, token, title, image;
  final int age, rating;

  const UserProfile({
    required this.name,
    required this.id,
    required this.age,
    required this.token,
    required this.title,
    required this.rating,
    required this.image,
  });
}
