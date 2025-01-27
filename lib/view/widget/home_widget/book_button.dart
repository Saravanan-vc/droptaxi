import 'package:droptaxi/service/responsive_service.dart';
import 'package:droptaxi/service/textstyle_service.dart';
import 'package:droptaxi/util/app_constant.dart';
import 'package:droptaxi/util/color_constant.dart';
import 'package:droptaxi/util/dimensions.dart';
import 'package:flutter/material.dart';

class BookButton extends StatelessWidget {
  final String label;
  final Function() onTap;
  const BookButton({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ResponsiveService.isRealMobel(context)
        ? GestureDetector(
            onTap: onTap,
            child: Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: Dimensions.paddingSizeSmall),
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                  color: ColorConstant.baseColor,
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
                  child: Text(
                AppConstant.bookme,
                style: TextstyleService.tabBar().copyWith(color: Colors.white),
              )),
            ),
          )
        : GestureDetector(
            onTap: onTap,
            child: Container(
              width: 400,
              height: 50,
              decoration: BoxDecoration(
                  color: ColorConstant.baseColor,
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: Text(
                  label,
                  style:
                      TextstyleService.tabBar().copyWith(color: Colors.white),
                ),
              ),
            ),
          );
  }
}

class PackageButton extends StatelessWidget {
  final String text;
  final Function() ontap;
  const PackageButton({super.key, required this.text, required this.ontap});

  @override
  Widget build(BuildContext context) {
    double minWidth = 150;
    double maxWidth = 250;
    double calculatedWidth = MediaQuery.sizeOf(context).width * 0.2;
    double clampedWidth = calculatedWidth.clamp(minWidth, maxWidth);
    return ResponsiveService.isRealMobel(context)
        ? GestureDetector(
          onTap:ontap ,
          child: Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: Dimensions.paddingSizeSmall),
              width: double.infinity,
              height: 45,
              decoration: BoxDecoration(
                  color: ColorConstant.baseColor,
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
                  child: Text(
                text,
                style: TextstyleService.tabBar().copyWith(color: Colors.white),
              )),
            ),
        )
        : GestureDetector(
          onTap: ontap,
          child: Container(
              width: clampedWidth,
              height: 45,
              decoration: BoxDecoration(
                  color: ColorConstant.baseColor,
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
                  child: Text(
                text,
                style: TextstyleService.tabBar().copyWith(color: Colors.white),
              )),
            ),
        );
  }
}
