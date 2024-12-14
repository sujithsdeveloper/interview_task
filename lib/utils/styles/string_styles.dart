import 'package:flutter/material.dart';
import 'package:interview_task/utils/constants/color_constants.dart';

class StringStyles {
  static TextStyle subHeadingStyle() {
    return const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
  }

  static TextStyle headingStyle() {
    return const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 25,
    );
  }

  static TextStyle appbarTitleStyle() {
    return const TextStyle(
        color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold);
  }

  static TextStyle priceStyle() {
    return const TextStyle(
        color: ColorConstants.primaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 20);
  }
}
