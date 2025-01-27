import 'package:droptaxi/service/textstyle_service.dart';
import 'package:droptaxi/util/app_constant.dart';
import 'package:droptaxi/util/color_constant.dart';
import 'package:droptaxi/util/dimensions.dart';
import 'package:flutter/material.dart';

class BasappBar extends StatelessWidget {
  const BasappBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      height: 150,
      width: double.infinity,
      decoration: const BoxDecoration(color: ColorConstant.baseColor),
      child: Expanded(
        child: Column(
          children: [
            Center(
              child: Text(
                AppConstant.bottomText,
                textAlign: TextAlign.center,
                style: TextstyleService.tabBar()
                    .copyWith(color: ColorConstant.secondayColor),
              ),
            ),
            Center(
              child: Text(
                AppConstant.bottomTextmsg,
                textAlign: TextAlign.center,
                style: TextstyleService.tabBar().copyWith(
                    color: ColorConstant.secondayColor,
                    fontSize: Dimensions.fontSizeSmall),
              ),
            ),
            const Spacer(),
            Center(
              child: Text(
                AppConstant.bottomEmail,
                textAlign: TextAlign.center,
                style: TextstyleService.tabBar().copyWith(
                    color: ColorConstant.secondayColor,
                    fontSize: Dimensions.fontSizeSmall),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
