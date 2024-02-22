import 'package:flutter/material.dart';

class ReviewValueModel {
  ReviewValueModel({
    this.message = '',
    this.function,
    required this.compare,
  });

  String message;
  final VoidCallback? function;
  final bool compare;
}
