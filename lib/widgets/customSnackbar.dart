import 'package:flutter/material.dart';
import 'package:interview_task/utils/constants/color_constants.dart';

SnackBar customSnackbar(
    {required String title, Color bgColor = ColorConstants.primaryColor}) {
  return SnackBar(backgroundColor: bgColor, content: Text(title));
}
