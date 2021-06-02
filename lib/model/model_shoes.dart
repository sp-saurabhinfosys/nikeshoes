import 'package:flutter/material.dart';

class ModelShoes {
  Color bgColor;
  String shoesName;
  String modelNumber;
  String image;
  int dummyPrice;
  int originalPrice;
  List<String> imageList;
  List<String> shoesSize;
  String description;
  bool isSelected;

  ModelShoes(
      {this.bgColor,
      this.shoesName,
      this.modelNumber,
      this.image,
      this.dummyPrice,
      this.originalPrice,
      this.imageList,
      this.shoesSize,
      this.description});
}
