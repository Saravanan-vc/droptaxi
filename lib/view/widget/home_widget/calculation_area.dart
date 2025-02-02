import 'package:droptaxi/service/responsive_service.dart';
import 'package:droptaxi/util/app_constant.dart';
import 'package:droptaxi/util/dimensions.dart';
import 'package:droptaxi/view/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculationArea extends StatelessWidget {
  const CalculationArea({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController =
        Get.find<HomeController>(tag: 'homecontroller');
    return Obx(
      () => Container(
        width: ResponsiveService.isMobel(context) ? 400 : 450,
        margin: EdgeInsets.symmetric(
            horizontal: ResponsiveService.isMobel(context)
                ? Dimensions.paddingSizeSmall
                : 0),
        padding: EdgeInsets.symmetric(
            horizontal: ResponsiveService.isMobel(context)
                ? Dimensions.paddingSizeSmall
                : Dimensions.paddingSizeMedium,
            vertical: Dimensions.paddingSizeMedium),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 0.8, color: Colors.black)),
        child: Column(
          children: [
            Center(
              child: Text("Distance : ${homeController.kilometer.value}Km"),
            ),
            Center(
              child: Text(
                  "Estimate : ₹  ${homeController.isSelected[0] ? homeController.priceforRide.value : homeController.isSelected[1] ? homeController.priceforRide.value * 1.5 : homeController.priceforRide.value * 2} *"),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                "[Base charges: ₹ ${homeController.isSelected[0] ? homeController.priceforRide.value - 600 : homeController.isSelected[1] ? homeController.priceforRide.value * 1.5 - 600 : homeController.priceforRide.value * 2 - 600} / Driver bata: ₹ 600  + Toll at actuals]",
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: Text(
                AppConstant.purchaseInfo,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: Dimensions.fontSizeSmall - 2,
                    color: Colors.blue[900],
                    fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
    );
  }
}
