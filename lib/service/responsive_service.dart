import 'package:flutter/material.dart';

class ResponsiveService {
  static bool isMobel(BuildContext context) =>
      MediaQuery.sizeOf(context).width < 600;
  static bool isRealMobel(BuildContext context) =>
      MediaQuery.sizeOf(context).width < 450;
  static bool isTablet(BuildContext context) =>
      MediaQuery.sizeOf(context).width < 1110;
}
