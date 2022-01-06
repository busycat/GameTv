import 'package:flutter/material.dart';

@immutable
class User {
  final String name;
  final int age;
  final String token;
  const User({required this.name, required this.age, required this.token});
}
