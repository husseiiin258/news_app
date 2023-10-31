import 'package:flutter/material.dart';

class CategoryModel {
  final String CategoryId;
  final String CategoryTitle;
  final String CategoryImage;
  final Color CategoryColor;

  CategoryModel(
      {required this.CategoryId,
      required this.CategoryTitle,
      required this.CategoryImage,
      required this.CategoryColor});
}
