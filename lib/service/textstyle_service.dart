import 'package:droptaxi/util/color_constant.dart';
import 'package:droptaxi/util/dimensions.dart';
import 'package:flutter/material.dart';

class TextstyleService {
  static TextStyle tabBar() {
    return TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: Dimensions.fontSizeLarge,
        color: ColorConstant.textColor);
  }

  static TextStyle bold() {
    return TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: Dimensions.fontSizeExtraLarge,
        color: ColorConstant.textColor);
  }

  static TextStyle tabBarhowver() {
    return TextStyle(
        fontWeight: FontWeight.w200,
        fontSize: Dimensions.fontSizeLarge,
        color: ColorConstant.howOverColor);
  }
}
