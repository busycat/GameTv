import 'package:flutter/material.dart';

@immutable
class AppException implements Exception {
  final String error;
  final int code;
  const AppException({required this.error, required this.code});
}
