import 'package:droptaxi/service/responsive_service.dart';
import 'package:droptaxi/util/app_constant.dart';
import 'package:droptaxi/util/color_constant.dart';
import 'package:droptaxi/util/dimensions.dart';
import 'package:droptaxi/util/image_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavWidget extends StatelessWidget implements PreferredSizeWidget {
  const NavWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ResponsiveService.isMobel(context)
          ? Dimensions.appBar
          : Dimensions.webappBar,
      width: double.infinity,
      decoration: const BoxDecoration(color: ColorConstant.baseColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSizeMedium),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ResponsiveService.isMobel(context)
                ? GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: const Icon(
                      Icons.menu_rounded,
                      color: ColorConstant.thirdColor,
                    ))
                : const Image(
                    height: Dimensions.paddingSizeExtremeLarge,
                    image: AssetImage(ImageUtil.icon),
                  ),
            ResponsiveService.isMobel(context)
                ? const Image(
                    height: Dimensions.paddingSizeExtremeLarge,
                    image: AssetImage(ImageUtil.icon),
                  )
                : const Image(
                    height: Dimensions.paddingSizeExtremeLarge,
                    image: AssetImage(ImageUtil.logo),
                  ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(ResponsiveService.isMobel(Get.context!)
          ? Dimensions.appBar
          : Dimensions.webappBar);
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorConstant.baseColor,
      width: Dimensions.appDrawer,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.currency_rupee,
                color: ColorConstant.whiteColor),
            title: const Text(AppConstant.traiff),
            onTap: () {
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_add_alt_1,
                color: ColorConstant.whiteColor),
            title: const Text(AppConstant.register),
            onTap: () {
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.login, color: ColorConstant.whiteColor),
            title: const Text(AppConstant.login),
            onTap: () {
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.message, color: ColorConstant.whiteColor),
            title: const Text(AppConstant.callback),
            onTap: () {
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            leading:
                const Icon(Icons.feed_rounded, color: ColorConstant.whiteColor),
            title: const Text(AppConstant.feedback),
            onTap: () {
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.mark_chat_unread,
                color: ColorConstant.whiteColor),
            title: const Text(AppConstant.whatsapp),
            onTap: () {
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.business_center,
                color: ColorConstant.whiteColor),
            title: const Text(AppConstant.business),
            onTap: () {
              Navigator.pop(context); // Close the drawer
            },
          ),
        ],
      ),
    );
  }
}
