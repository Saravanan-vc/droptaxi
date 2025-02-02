import 'package:droptaxi/service/textstyle_service.dart';
import 'package:droptaxi/util/app_constant.dart';
import 'package:droptaxi/util/dimensions.dart';
import 'package:droptaxi/view/controller/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class TapbarWidget extends StatelessWidget {
  const TapbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController =
        Get.find<HomeController>(tag: 'homecontroller');
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Dimensions.paddingSizeExtraLarge,
      ),
      child: Center(
          child: Obx(
        () => Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
                onTap: () {
                  homeController.changeSelected(0, homeController.isSelected);
                  homeController.dropIndex.value = 0;
                },
                child: homeController.isSelected[0]
                    ? Text(
                        AppConstant.singleTrip,
                        style: TextstyleService.tabBar().copyWith(
                            fontWeight: FontWeight.w900,
                            fontSize: Dimensions.fontSizeExtraLarge),
                      )
                    : const HowoverTexxt(text: AppConstant.singleTrip)),
            SizedBox(width: MediaQuery.sizeOf(context).width * 0.17),
            GestureDetector(
                onTap: () {
                  homeController.changeSelected(1, homeController.isSelected);
                  homeController.dropIndex.value = 1;
                },
                child: homeController.isSelected[1]
                    ? Text(
                        AppConstant.multiTrip,
                        style: TextstyleService.tabBar().copyWith(
                            fontWeight: FontWeight.w900,
                            fontSize: Dimensions.fontSizeExtraLarge),
                      )
                    : const HowoverTexxt(text: AppConstant.multiTrip)),
          ],
        ),
      )),
    );
  }
}

class HowoverTexxt extends StatelessWidget {
  final String text;
  const HowoverTexxt({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    HomeController homeController =
        Get.find<HomeController>(tag: 'homecontroller');
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        switch (text) {
          case AppConstant.singleTrip:
            homeController.isSinglehowver.value = true;

            break;
          case AppConstant.multiTrip:
            homeController.isMultihowver.value = true;

            break;
          case AppConstant.bigTrip:
            homeController.isPackagehowver.value = true;

            break;
        }
      },
      onExit: (_) {
        switch (text) {
          case AppConstant.singleTrip:
            homeController.isSinglehowver.value = false;
            break;
          case AppConstant.multiTrip:
            homeController.isMultihowver.value = false;
            break;
          case AppConstant.bigTrip:
            homeController.isPackagehowver.value = false;
            break;
        }
      },
      child: Obx(() {
        return Text(
          text,
          style: _updateHowver(text),
        );
      }),
    );
  }

  _updateHowver(String text) {
    HomeController homeController =
        Get.find<HomeController>(tag: 'homecontroller');
    switch (text) {
      case AppConstant.singleTrip:
        return homeController.isSinglehowver.value
            ? TextstyleService.tabBarhowver()
            : TextstyleService.tabBar();

      case AppConstant.multiTrip:
        return homeController.isMultihowver.value
            ? TextstyleService.tabBarhowver()
            : TextstyleService.tabBar();

      case AppConstant.bigTrip:
        return homeController.isPackagehowver.value
            ? TextstyleService.tabBarhowver()
            : TextstyleService.tabBar();
    }
  }
}
