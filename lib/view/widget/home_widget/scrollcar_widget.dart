import 'package:droptaxi/util/color_constant.dart';
import 'package:droptaxi/util/dimensions.dart';
import 'package:droptaxi/util/image_util.dart';
import 'package:droptaxi/view/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScrollcarWidget extends StatelessWidget {
  const ScrollcarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController =
        Get.find<HomeController>(tag: 'homecontroller');
    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
      height: 180,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                homeController.changeSelected(index, homeController.isTaped);
                homeController.calucaltionPrice(
                    int.parse(ImageUtil.carList[index]["price"]!));
              },
              child: HowverImage(index: index)),
          separatorBuilder: (context, index) => const SizedBox(width: 20),
          itemCount: ImageUtil.carList.length),
    );
  }
}

class HowverImage extends StatelessWidget {
  final int index;
  const HowverImage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    HomeController homeController =
        Get.find<HomeController>(tag: 'homecontroller');
    return Obx(() => MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                width: 180,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset(
                        ImageUtil.carList[index]["image"]!,
                        color: homeController.isTaped[index]
                            ? ColorConstant.thirdColor
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                  alignment: const Alignment(0, 0.7),
                  child: Text(ImageUtil.carList[index]['car']!)),
              Align(
                  alignment: const Alignment(0, 0.9),
                  child: Text("₹${ImageUtil.carList[index]["price"]}/km"))
            ],
          ),
        ));
  }
}
