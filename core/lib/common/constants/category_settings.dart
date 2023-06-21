import 'package:flutter/material.dart';

final List<CategoryModel> listCategoryModel = <CategoryModel>[
  CategoryModel(const Color(0xff147B56)),
  CategoryModel(const Color(0xff0099CC)),
  CategoryModel(const Color(0xffCC9900)),
  CategoryModel(const Color(0xff7AAD4F)),
  CategoryModel(const Color(0xff147B56)),
  CategoryModel(const Color(0xff0099CC)),
  CategoryModel(const Color(0xffCC9900)),
  CategoryModel(const Color(0xff7AAD4F)),
  CategoryModel(const Color(0xff147B56)),
  CategoryModel(const Color(0xff0099CC)),
  CategoryModel(const Color(0xffCC9900)),
  CategoryModel(const Color(0xff7AAD4F)),
];

class CategoryModel {
  Color primaryColor;
  CategoryModel(this.primaryColor);
}
