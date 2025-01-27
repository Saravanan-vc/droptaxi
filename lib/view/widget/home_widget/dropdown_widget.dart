import 'package:droptaxi/service/responsive_service.dart';
import 'package:droptaxi/service/textstyle_service.dart';
import 'package:droptaxi/util/color_constant.dart';
import 'package:droptaxi/util/dimensions.dart';
import 'package:droptaxi/util/image_util.dart';
import 'package:droptaxi/view/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropdownWidget extends StatelessWidget {
  const DropdownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController =
        Get.find<HomeController>(tag: 'homecontroller');
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Obx(
          () => SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.4,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12, spreadRadius: 1, blurRadius: 20)
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: DropdownButton<String>(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Dimensions.paddingSizeDefault),
                  isExpanded: true,
                  borderRadius: BorderRadius.circular(6),
                  underline: const SizedBox(),
                  value: homeController.fromSelect.value,
                  items: homeController.fromdrop
                      .map((e) => DropdownMenuItem<String>(
                            value: e.location,
                            child: Text(e.location),
                          ))
                      .toList(),
                  onChanged: (selected) {
                    debugPrint("\u001B[33m selected : \u001B[35m$selected");
                    if (selected != null &&
                        homeController.toSelect.value != selected) {
                      for (var value in homeController.fromdrop) {
                        value.location == selected
                            ? homeController.fromPostion.value = {
                                "lat": value.lat,
                                "long": value.long
                              }
                            : null;
                      }
                      if (homeController.toSelect.value != "To") {
                        homeController.caluclation(homeController.fromPostion,
                            homeController.toPostion);
                        debugPrint('toSelect');
                        homeController.isTaped.asMap().forEach((index, value) {
                          if (value) {
                            homeController.calucaltionPrice(
                                int.parse(ImageUtil.carList[index]["price"]!));
                          }
                        });
                      }
                      homeController.fromSelect.value = selected.tr;
                    }
                  },
                ),
              ),
            ),
          ),
        ),
        Obx(
          () => SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.4,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12, spreadRadius: 1, blurRadius: 20)
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: DropdownButton<String>(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Dimensions.paddingSizeDefault),
                  isExpanded: true,
                  borderRadius: BorderRadius.circular(6),
                  underline: const SizedBox(),
                  value: homeController.toSelect.value,
                  items: homeController.todrop
                      .map((e) => DropdownMenuItem<String>(
                            value: e.location,
                            child: Text(e.location),
                          ))
                      .toList(),
                  onChanged: (selected) {
                    if (selected != null &&
                        homeController.fromSelect.value != selected) {
                      for (var value in homeController.todrop) {
                        value.location == selected
                            ? homeController.toPostion.value = {
                                "lat": value.lat,
                                "long": value.long
                              }
                            : null;
                      }
                      if (homeController.fromSelect.value != "From") {
                        homeController.caluclation(homeController.fromPostion,
                            homeController.toPostion);
                        debugPrint('fromselect');
                        homeController.isTaped.asMap().forEach((index, value) {
                          if (value) {
                            homeController.calucaltionPrice(
                                int.parse(ImageUtil.carList[index]["price"]!));
                          }
                        });
                      }
                      homeController.toSelect.value = selected.tr;
                    }
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DropdownWidgetRoundTrip extends StatelessWidget {
  const DropdownWidgetRoundTrip({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController =
        Get.find<HomeController>(tag: 'homecontroller');
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: ResponsiveService.isMobel(context)
                ? MediaQuery.sizeOf(context).width * 0.4
                : MediaQuery.sizeOf(context).width * 0.3,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12, spreadRadius: 1, blurRadius: 20)
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: DropdownButton<String>(
                  hint: Text('Number of da'),
                  padding: const EdgeInsets.symmetric(
                      horizontal: Dimensions.paddingSizeDefault),
                  isExpanded: true,
                  borderRadius: BorderRadius.circular(6),
                  underline: const SizedBox(),
                  value: homeController.roundTrip.value,
                  items: homeController.listOfRound
                      .map((e) => DropdownMenuItem<String>(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  onChanged: (selected) {
                    if (selected != null) {
                      homeController.roundTrip.value = selected;
                    }
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: ResponsiveService.isMobel(context)
                    ? MediaQuery.sizeOf(context).width * 0.4
                    : MediaQuery.sizeOf(context).width * 0.3,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 1,
                          blurRadius: 20)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: DropdownButton<String>(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Dimensions.paddingSizeDefault),
                      isExpanded: true,
                      borderRadius: BorderRadius.circular(6),
                      underline: const SizedBox(),
                      value: homeController.fromSelect.value,
                      items: homeController.fromdrop
                          .map((e) => DropdownMenuItem<String>(
                                value: e.location,
                                child: Text(e.location),
                              ))
                          .toList(),
                      onChanged: (selected) {
                        debugPrint("\u001B[33m selected : \u001B[35m$selected");
                        if (selected != null) {
                          for (var value in homeController.fromdrop) {
                            value.location == selected
                                ? homeController.fromPostion.value = {
                                    "lat": value.lat,
                                    "long": value.long
                                  }
                                : null;
                          }
                          if (homeController.toSelect.value != "To") {
                            homeController.caluclation(
                                homeController.fromPostion,
                                homeController.toPostion);
                            debugPrint('toSelect');
                          }
                          homeController.fromSelect.value = selected.tr;
                        }
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: ResponsiveService.isMobel(context)
                    ? MediaQuery.sizeOf(context).width * 0.4
                    : MediaQuery.sizeOf(context).width * 0.3,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 1,
                          blurRadius: 20)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: DropdownButton<String>(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Dimensions.paddingSizeDefault),
                      isExpanded: true,
                      borderRadius: BorderRadius.circular(6),
                      underline: const SizedBox(),
                      value: homeController.toSelect.value,
                      items: homeController.todrop
                          .map((e) => DropdownMenuItem<String>(
                                value: e.location,
                                child: Text(e.location),
                              ))
                          .toList(),
                      onChanged: (selected) {
                        if (selected != null &&
                            homeController.fromSelect.value != selected) {
                          for (var value in homeController.todrop) {
                            value.location == selected
                                ? homeController.toPostion.value = {
                                    "lat": value.lat,
                                    "long": value.long
                                  }
                                : null;
                          }
                          if (homeController.fromSelect.value != "From") {
                            // debugPrint(homeController.fromPostion.toString());
                            // debugPrint(homeController.toPostion.toString());

                            homeController.caluclation(
                                homeController.fromPostion,
                                homeController.toPostion);
                            debugPrint('fromselect');
                          }
                          homeController.toSelect.value = selected.tr;
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DropdownWidgetPackageTrip extends StatelessWidget {
  const DropdownWidgetPackageTrip({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("${MediaQuery.sizeOf(context).width / 1.4}");
    HomeController homeController =
        Get.find<HomeController>(tag: 'homecontroller');
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Container(
            height: 45,
            width: ResponsiveService.isMobel(context)
                ? ResponsiveService.isRealMobel(context)
                    ? MediaQuery.sizeOf(context).width - 20
                    : MediaQuery.sizeOf(context).width / 1.4
                : 355.528,
            decoration: BoxDecoration(
                border: Border.all(width: 1.2, color: ColorConstant.thirdColor),
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Obx(() => GestureDetector(
                      onTap: () {
                        homeController.isOutstain.value =
                            !homeController.isOutstain.value;
                        homeController.packages.value = "Out Station";
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal:
                                Dimensions.paddingSizeExtremeLarge + 22),
                        margin: const EdgeInsets.only(left: 2, right: 2),
                        height: 40,
                        decoration: BoxDecoration(
                            color: homeController.isOutstain.value
                                ? ColorConstant.baseColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                            child: Text(
                          "Out Station",
                          style: TextstyleService.tabBar().copyWith(
                            color: homeController.isOutstain.value
                                ? ColorConstant.secondayColor
                                : ColorConstant.baseColor,
                          ),
                        )),
                      ),
                    )),
                Obx(() => GestureDetector(
                      onTap: () {
                        homeController.isOutstain.value =
                            !homeController.isOutstain.value;
                        homeController.packages.value = "local";
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal:
                                Dimensions.paddingSizeExtremeLarge + 22),
                        margin: const EdgeInsets.only(right: 2, left: 2),
                        height: 40,
                        decoration: BoxDecoration(
                            color: homeController.isOutstain.value
                                ? Colors.transparent
                                : ColorConstant.baseColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                            child: Text(
                          "Local",
                          style: TextstyleService.tabBar().copyWith(
                              color: homeController.isOutstain.value
                                  ? ColorConstant.baseColor
                                  : ColorConstant.secondayColor),
                        )),
                      ),
                    ))
              ],
            ),
          )),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: ResponsiveService.isMobel(context)
                    ? MediaQuery.sizeOf(context).width * 0.4
                    : MediaQuery.sizeOf(context).width * 0.3,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 1,
                          blurRadius: 20)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: DropdownButton<String>(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Dimensions.paddingSizeDefault),
                      isExpanded: true,
                      borderRadius: BorderRadius.circular(6),
                      underline: const SizedBox(),
                      value: homeController.fromSelect.value,
                      items: homeController.fromdrop
                          .map((e) => DropdownMenuItem<String>(
                                value: e.location,
                                child: Text(e.location),
                              ))
                          .toList(),
                      onChanged: (selected) {
                        debugPrint("\u001B[33m selected : \u001B[35m$selected");
                        if (selected != null) {
                          for (var value in homeController.fromdrop) {
                            value.location == selected
                                ? homeController.fromPostion.value = {
                                    "lat": value.lat,
                                    "long": value.long
                                  }
                                : null;
                          }
                          if (homeController.toSelect.value != "To") {
                            homeController.caluclation(
                                homeController.fromPostion,
                                homeController.toPostion);
                            debugPrint('toSelect');
                          }
                          homeController.fromSelect.value = selected.tr;
                        }
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: ResponsiveService.isMobel(context)
                    ? MediaQuery.sizeOf(context).width * 0.4
                    : MediaQuery.sizeOf(context).width * 0.3,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 1,
                          blurRadius: 20)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: DropdownButton<String>(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Dimensions.paddingSizeDefault),
                      isExpanded: true,
                      borderRadius: BorderRadius.circular(6),
                      underline: const SizedBox(),
                      value: homeController.toSelect.value,
                      items: homeController.todrop
                          .map((e) => DropdownMenuItem<String>(
                                value: e.location,
                                child: Text(e.location),
                              ))
                          .toList(),
                      onChanged: (selected) {
                        if (selected != null &&
                            homeController.fromSelect.value != selected) {
                          for (var value in homeController.todrop) {
                            value.location == selected
                                ? homeController.toPostion.value = {
                                    "lat": value.lat,
                                    "long": value.long
                                  }
                                : null;
                          }
                          if (homeController.fromSelect.value != "From") {
                            // debugPrint(homeController.fromPostion.toString());
                            // debugPrint(homeController.toPostion.toString());

                            homeController.caluclation(
                                homeController.fromPostion,
                                homeController.toPostion);
                            debugPrint('fromselect');
                          }
                          homeController.toSelect.value = selected.tr;
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

const List<Widget> tapBarList = [
  DropdownWidget(),
  DropdownWidgetRoundTrip(),
  DropdownWidgetPackageTrip()
];

class AlldropdownButton extends StatelessWidget {
  const AlldropdownButton({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController =
        Get.find<HomeController>(tag: 'homecontroller');
    return Obx(() => tapBarList[homeController.dropIndex.value]);
  }
}
