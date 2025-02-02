import 'package:droptaxi/service/textstyle_service.dart';
import 'package:droptaxi/util/app_constant.dart';
import 'package:droptaxi/util/color_constant.dart';
import 'package:droptaxi/util/dimensions.dart';
import 'package:droptaxi/view/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BasappBar extends StatelessWidget {
  const BasappBar({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController =
        Get.find<HomeController>(tag: 'homecontroller');
    return Obx(() => Container(
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
                    homeController.information.value.addressInfo.isEmpty
                        ? ""
                        : homeController.information.value.addressInfo,
                    textAlign: TextAlign.center,
                    style: TextstyleService.tabBar().copyWith(
                        color: ColorConstant.secondayColor,
                        fontSize: Dimensions.fontSizeSmall),
                  ),
                ),
                const Spacer(),
                Center(
                  child: Text(
                    "+91 ${homeController.information.value.mobileNumber == 0 ? "" : homeController.information.value.mobileNumber} |  ${homeController.information.value.emailInfo.isEmpty ? "" : homeController.information.value.emailInfo}",
                    textAlign: TextAlign.center,
                    style: TextstyleService.tabBar().copyWith(
                        color: ColorConstant.secondayColor,
                        fontSize: Dimensions.fontSizeSmall),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
