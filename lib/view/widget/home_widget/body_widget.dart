import 'package:droptaxi/service/responsive_service.dart';
import 'package:droptaxi/service/textstyle_service.dart';
import 'package:droptaxi/util/app_constant.dart';
import 'package:droptaxi/util/color_constant.dart';
import 'package:droptaxi/util/dimensions.dart';
import 'package:droptaxi/util/image_util.dart';
import 'package:droptaxi/view/controller/home_controller.dart';
import 'package:droptaxi/view/screens/contant_view.dart';
import 'package:droptaxi/view/screens/form_view.dart';
import 'package:droptaxi/view/widget/home_widget/book_button.dart';
import 'package:droptaxi/view/widget/home_widget/calculation_area.dart';
import 'package:droptaxi/view/widget/home_widget/dropdown_widget.dart';
import 'package:droptaxi/view/widget/home_widget/listofstatic.dart';
import 'package:droptaxi/view/widget/home_widget/scrollcar_widget.dart';
import 'package:droptaxi/view/widget/home_widget/tapbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController =
        Get.find<HomeController>(tag: 'homecontroller');
    return SingleChildScrollView(
        controller: homeController.scrollController,
        scrollDirection: Axis.vertical,
        child: Obx(
          () => SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: Dimensions.paddingSizeSmall,
                      horizontal: Dimensions.paddingSizeDefault),
                  child: Text(
                    "${AppConstant.info}  +91 ${homeController.information.value.mobileNumber == 0 ? "" : homeController.information.value.mobileNumber}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: ColorConstant.thirdColor,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const Divider(
                  color: ColorConstant.baseColor,
                  thickness: 0.8,
                ),
                const TapbarWidget(),
                const SizedBox(height: 20),
                const AlldropdownButton(),
                const SizedBox(height: 30),
                const ScrollcarWidget(),
                const SizedBox(height: 10),
                homeController.fromSelect.value != "From" &&
                        homeController.toSelect.value != 'To' &&
                        homeController.isTaped.contains(true)
                    ? const CalculationArea()
                    : const SizedBox(),
                const SizedBox(height: 30),
                homeController.fromSelect.value != "From" &&
                        homeController.toSelect.value != 'To' &&
                        homeController.isTaped.contains(true)
                    ? BookButton(
                        label: AppConstant.bookme,
                        onTap: homeController.isSelected[0]
                            ? () {
                                if (homeController.fromSelect.value != "From" &&
                                    homeController.toSelect.value != "To") {
                                  homeController.isPickedBoth.value = true;
                                }
                                homeController.productSelcted.value.amout =
                                    homeController.priceforRide.value;
                                homeController.isTaped
                                    .asMap()
                                    .forEach((index, value) {
                                  if (value) {
                                    homeController.productSelcted.value.car =
                                        ImageUtil.carList[index]["car"]!;
                                  }
                                });
                                homeController.productSelcted.value.from =
                                    homeController.fromSelect.value;
                                homeController.productSelcted.value.to =
                                    homeController.toSelect.value;
                                homeController.productSelcted.value.service =
                                    "Drop Trip";
                               
                              }
                            : homeController.isSelected[1]
                                ? () {
                                    if (homeController.fromSelect.value !=
                                            "From" &&
                                        homeController.toSelect.value != "To") {
                                      homeController.isPickedBoth.value = true;
                                    }
                                    homeController.productSelcted.value.amout =
                                        (homeController.priceforRide.value *
                                                1.5)
                                            .round();
                                    homeController.isTaped
                                        .asMap()
                                        .forEach((index, value) {
                                      if (value) {
                                        homeController
                                                .productSelcted.value.car =
                                            ImageUtil.carList[index]["car"]!;
                                      }
                                    });
                                    homeController.productSelcted.value.from =
                                        homeController.fromSelect.value;
                                    homeController.productSelcted.value.to =
                                        homeController.toSelect.value;
                                    homeController.productSelcted.value
                                        .service = "Round Trip";
                                    homeController.productSelcted.value.rounds =
                                        homeController.roundTrip.value;
                                       
                                  }
                                : () {
                                    if (homeController.fromSelect.value !=
                                            "From" &&
                                        homeController.toSelect.value != "To") {
                                      homeController.isPickedBoth.value = true;
                                    }
                                    homeController.productSelcted.value.amout =
                                        (homeController.priceforRide.value * 2)
                                            .round();
                                    homeController.isTaped
                                        .asMap()
                                        .forEach((index, value) {
                                      if (value) {
                                        homeController
                                                .productSelcted.value.car =
                                            ImageUtil.carList[index]["car"]!;
                                      }
                                    });
                                    homeController.productSelcted.value.from =
                                        homeController.fromSelect.value;
                                    homeController.productSelcted.value.to =
                                        homeController.toSelect.value;
                                    homeController.productSelcted.value
                                        .service = "Package";
                                    homeController
                                            .productSelcted.value.packages =
                                        homeController.packages.value;
                                  })
                    : const SizedBox(),
                //  const SizedBox(height: 20),
                homeController.isPickedBoth.value
                    ? const FromView()
                    : Container(),
                // const SizedBox(height: 10),
                const ListofStaticImage(),

                //const Divider(thickness: 2, color: ColorConstant.baseColor),
                const SizedBox(height: 20),
                // const Promotion(),
                // const SizedBox(height: 20),
                // const DetailsServices(),
                Container(
                  width: double.infinity,
                  color: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  height: 140,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 800,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ContantView(
                                                  values: "About",
                                                )));
                                  },
                                  child: Text(
                                    "About Us",
                                    style: TextStyle(
                                        fontSize: ResponsiveService.isRealMobel(
                                                context)
                                            ? 16
                                            : 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                        fontFamily: "services"),
                                  )),
                            ),
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ContantView(
                                                  values: "FAQs",
                                                )));
                                  },
                                  child: Text(
                                    "FAQs",
                                    style: TextStyle(
                                        fontSize: ResponsiveService.isRealMobel(
                                                context)
                                            ? 16
                                            : 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "services"),
                                  )),
                            ),
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ContantView(
                                                  values: "Luggage",
                                                )));
                                  },
                                  child: Text(
                                    "Luggage",
                                    style: TextStyle(
                                        fontSize: ResponsiveService.isRealMobel(
                                                context)
                                            ? 16
                                            : 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "services"),
                                  )),
                            ),
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ContantView(
                                                  values: "Cancelation",
                                                )));
                                  },
                                  child: Text(
                                    "Cancelation",
                                    style: TextStyle(
                                        fontSize: ResponsiveService.isRealMobel(
                                                context)
                                            ? 16
                                            : 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "services"),
                                  )),
                            ),
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ContantView(
                                                  values: "Refund",
                                                )));
                                  },
                                  child: Text(
                                    "Refund",
                                    style: TextStyle(
                                        fontSize: ResponsiveService.isRealMobel(
                                                context)
                                            ? 16
                                            : 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "services"),
                                  )),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      Text(
                        homeController.information.value.addressInfo.isEmpty
                            ? ""
                            : homeController.information.value.addressInfo,
                        textAlign: TextAlign.center,
                        style: TextstyleService.tabBar().copyWith(
                          fontSize:
                              ResponsiveService.isRealMobel(context) ? 12 : 14,
                          color: ColorConstant.secondayColor,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "+91 ${homeController.information.value.mobileNumber == 0 ? "" : homeController.information.value.mobileNumber} |  ${homeController.information.value.emailInfo.isEmpty ? "" : homeController.information.value.emailInfo}",
                        textAlign: TextAlign.center,
                        style: TextstyleService.tabBar().copyWith(
                            color: ColorConstant.secondayColor,
                            fontSize: ResponsiveService.isRealMobel(context)
                                ? 12
                                : 14),
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
