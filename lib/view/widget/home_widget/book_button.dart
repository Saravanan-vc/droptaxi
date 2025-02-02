import 'package:droptaxi/service/responsive_service.dart';
import 'package:droptaxi/service/textstyle_service.dart';
import 'package:droptaxi/util/app_constant.dart';
import 'package:droptaxi/util/color_constant.dart';
import 'package:droptaxi/util/dimensions.dart';
import 'package:droptaxi/view/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookButton extends StatelessWidget {
  final String label;
  final Function() onTap;
  const BookButton({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    HomeController homeController =
        Get.find<HomeController>(tag: 'homecontroller');
    return ResponsiveService.isRealMobel(context)
        ? Obx(() => MouseRegion(
              cursor: homeController.isTapedBooked.value
                  ? SystemMouseCursors.wait
                  : SystemMouseCursors.click,
              onEnter: (_) {
                homeController.isBooked.value = true;
              },
              onExit: (_) {
                homeController.isBooked.value = false;
              },
              child: InkWell(
                onTapDown: (_) {
                  homeController.isTapedBooked.value = true;
                },
                onTapUp: (_) {
                  homeController.isTapedBooked.value = false;
                },
                onTap: onTap,
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: Dimensions.paddingSizeSmall),
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      color: homeController.isBooked.value
                          ? homeController.isTapedBooked.value
                              ? Colors.amber[900]
                              : ColorConstant.howOverColor
                          : ColorConstant.baseColor,
                      boxShadow: [
                        homeController.isBooked.value
                            ? BoxShadow(
                                color: Colors.black54,
                                spreadRadius: 4,
                                blurRadius: 8,
                                offset: homeController.isTapedBooked.value
                                    ? const Offset(0, 0)
                                    : const Offset(6, 6))
                            : BoxShadow()
                      ],
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                      child: Text(
                    AppConstant.bookme,
                    style:
                        TextstyleService.tabBar().copyWith(color: Colors.white),
                  )),
                ),
              ),
            ))
        : Obx(
            () => MouseRegion(
              cursor: homeController.isTapedBooked.value
                  ? SystemMouseCursors.wait
                  : SystemMouseCursors.click,
              onEnter: (_) {
                homeController.isBooked.value = true;
              },
              onExit: (_) {
                homeController.isBooked.value = false;
              },
              child: InkWell(
                onTapDown: (_) {
                  homeController.isTapedBooked.value = true;
                },
                onTapUp: (_) {
                  homeController.isTapedBooked.value = false;
                },
                onTap: onTap,
                child: Container(
                  width: 400,
                  height: 50,
                  decoration: BoxDecoration(
                      color: homeController.isBooked.value
                          ? homeController.isTapedBooked.value
                              ? Colors.amber[900]
                              : ColorConstant.howOverColor
                          : ColorConstant.baseColor,
                      boxShadow: [
                        homeController.isBooked.value
                            ? BoxShadow(
                                color: Colors.black54,
                                spreadRadius: 4,
                                blurRadius: 8,
                                offset: homeController.isTapedBooked.value
                                    ? const Offset(0, 0)
                                    : const Offset(6, 6))
                            : BoxShadow()
                      ],
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: Text(
                      label,
                      style: TextstyleService.tabBar()
                          .copyWith(color: Colors.white),
                    ),
                  ),
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
    HomeController homeController =
        Get.find<HomeController>(tag: 'homecontroller');
    return ResponsiveService.isRealMobel(context)
        ? Obx(() => MouseRegion(
              onEnter: (_) {
                homeController.isEntered.value = true;
              },
              onExit: (_) {
                homeController.isEntered.value = false;
              },
              cursor: homeController.isTapedSubmit.value
                  ? SystemMouseCursors.wait
                  : SystemMouseCursors.click,
              child: InkWell(
                onTapDown: (_) {
                  homeController.isTapedSubmit.value = true;
                },
                onTapUp: (_) {
                  homeController.isTapedSubmit.value = false;
                },
                onTap: ontap,
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: Dimensions.paddingSizeSmall),
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                      color: homeController.isEntered.value
                          ? homeController.isTapedSubmit.value
                              ? Colors.amber[900]
                              : ColorConstant.howOverColor
                          : ColorConstant.baseColor,
                      boxShadow: [
                        homeController.isEntered.value
                            ? BoxShadow(
                                color: Colors.black54,
                                spreadRadius: 4,
                                blurRadius: 8,
                                offset: homeController.isTapedSubmit.value
                                    ? const Offset(0, 0)
                                    : const Offset(6, 6))
                            : BoxShadow()
                      ],
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                      child: Text(
                    text,
                    style:
                        TextstyleService.tabBar().copyWith(color: Colors.white),
                  )),
                ),
              ),
            ))
        : Obx(
            () => MouseRegion(
              onEnter: (_) {
                homeController.isEntered.value = true;
              },
              onExit: (_) {
                homeController.isEntered.value = false;
              },
              cursor: homeController.isTapedSubmit.value
                  ? SystemMouseCursors.wait
                  : SystemMouseCursors.click,
              child: InkWell(
                onTapDown: (_) {
                  homeController.isTapedSubmit.value = true;
                },
                onTapUp: (_) {
                  homeController.isTapedSubmit.value = false;
                },
                onTap: ontap,
                child: Container(
                  width: 400,
                  height: 45,
                  decoration: BoxDecoration(
                      color: homeController.isEntered.value
                          ? homeController.isTapedSubmit.value
                              ? Colors.amber[900]
                              : ColorConstant.howOverColor
                          : ColorConstant.baseColor,
                      boxShadow: [
                        homeController.isEntered.value
                            ? BoxShadow(
                                color: Colors.black54,
                                spreadRadius: 4,
                                blurRadius: 8,
                                offset: homeController.isTapedSubmit.value
                                    ? const Offset(0, 0)
                                    : const Offset(6, 6))
                            : BoxShadow()
                      ],
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                      child: Text(
                    text,
                    style:
                        TextstyleService.tabBar().copyWith(color: Colors.white),
                  )),
                ),
              ),
            ),
          );
  }
}
