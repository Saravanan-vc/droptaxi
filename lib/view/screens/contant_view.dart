import 'package:droptaxi/service/responsive_service.dart';
import 'package:droptaxi/util/app_constant.dart';
import 'package:droptaxi/util/dimensions.dart';
import 'package:droptaxi/util/image_util.dart';
import 'package:droptaxi/view/controller/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ContantView extends StatelessWidget {
  final String values;
  const ContantView({super.key, required this.values});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 80,
              padding: EdgeInsets.symmetric(
                  horizontal: ResponsiveService.isMobel(context) ? 15 : 80),
              width: double.infinity,
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        CupertinoIcons.home,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                  ),
                 Image.asset(
                   width: 350,
                    fit: BoxFit.contain,
                    ImageUtil.logo,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ResponsiveService.isMobel(context) ? 15 : 80),
              child: value(values),
            ),
          ],
        ),
      ),
    ));
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

// class customNope extends StatelessWidget {
//   final String values;
//   const customNope({super.key, required this.values});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             expandedHeight: 120,
//             flexibleSpace: Container(
//               height: 60,
//               padding: EdgeInsets.symmetric(
//                   horizontal: ResponsiveService.isMobel(context) ? 15 : 80),
//               width: double.infinity,
//               color: Colors.black,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                     child: const Icon(
//                       Icons.arrow_back_ios,
//                       size: 25,
//                       color: Colors.white,
//                     ),
//                   ),
//                   const Image(
//                     height: Dimensions.paddingSizeExtremeLarge,
//                     image: AssetImage(ImageUtil.logo),
//                     fit: BoxFit.fitHeight,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           // SliverToBoxAdapter(
//           //   child: const SizedBox(height: 20),
//           // ),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: EdgeInsets.symmetric(
//                   horizontal: ResponsiveService.isMobel(context) ? 15 : 80),
//               child:
//                   value(values), // Assuming this is a static method or widget
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget value(String v) {
//     HomeController homeController =
//         Get.find<HomeController>(tag: 'homecontroller');
//     switch (v) {
//       case "About":
//         return Text(
//           homeController.aboutUs.value,
//           style: TextStyle(
//               fontSize: Dimensions.fontSizeLarge,
//               fontWeight: FontWeight.w500,
//               fontFamily: "services"),
//         );
//       case "Refund":
//         return Text(
//           homeController.refundCont.value,
//           style: TextStyle(
//               fontSize: Dimensions.fontSizeLarge,
//               fontWeight: FontWeight.w500,
//               fontFamily: "services"),
//         );
//       case "Cancelation":
//         return Text(
//           homeController.cancelCont.value,
//           style: TextStyle(
//               fontSize: Dimensions.fontSizeLarge,
//               fontWeight: FontWeight.w500,
//               fontFamily: "services"),
//         );
//       case "Luggage":
//         return Text(
//           homeController.luggageCont.value,
//           style: TextStyle(
//               fontSize: Dimensions.fontSizeLarge,
//               fontWeight: FontWeight.w500,
//               fontFamily: "services"),
//         );
//       case "FAQs":
//         return Text(
//           homeController.faqs.value,
//           style: TextStyle(
//               fontSize: Dimensions.fontSizeLarge,
//               fontWeight: FontWeight.w500,
//               fontFamily: "services"),
//         );
//       default:
//         return Container();
//     }
//   }
// }
