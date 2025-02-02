import 'package:droptaxi/service/textstyle_service.dart';
import 'package:droptaxi/util/color_constant.dart';
import 'package:droptaxi/util/dimensions.dart';
import 'package:droptaxi/view/controller/home_controller.dart';
import 'package:droptaxi/view/widget/home_widget/basapp_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsServices extends StatelessWidget {
  const DetailsServices({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController =
        Get.find<HomeController>(tag: "homecontroller");
    return Obx(
      () => Container(
        width: 870,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
           
            const SizedBox(height: 40),
            value(homeController.isInfoe.value),
            const SizedBox(height: 40),
            
          ],
        ),
      ),
    );
  }

  Widget value(String v) {
    HomeController homeController =
        Get.find<HomeController>(tag: 'homecontroller');
    switch (v) {
      case "About":
        return Text(
          homeController.aboutUs.value,
          style: TextStyle(
              fontSize: Dimensions.fontSizeLarge,
              fontWeight: FontWeight.w500,
              fontFamily: "services"),
        );
      case "Refund":
        return Text(
          homeController.refundCont.value,
          style: TextStyle(
              fontSize: Dimensions.fontSizeLarge,
              fontWeight: FontWeight.w500,
              fontFamily: "services"),
        );
      case "Cancelation":
        return Text(
          homeController.cancelCont.value,
          style: TextStyle(
              fontSize: Dimensions.fontSizeLarge,
              fontWeight: FontWeight.w500,
              fontFamily: "services"),
        );
      case "Luggage":
        return Text(
          homeController.luggageCont.value,
          style: TextStyle(
              fontSize: Dimensions.fontSizeLarge,
              fontWeight: FontWeight.w500,
              fontFamily: "services"),
        );
      case "FAQs":
        return Text(
          homeController.faqs.value,
          style: TextStyle(
              fontSize: Dimensions.fontSizeLarge,
              fontWeight: FontWeight.w500,
              fontFamily: "services"),
        );
      default:
        return Container();
    }
  }
}
