import 'package:droptaxi/view/controller/home_controller.dart';
import 'package:get/get.dart';

class Dependies {
  static injectionController() {
    Get.put(HomeController(), tag: "homecontroller");
  }
}


/**
web       1:676938262003:web:288e1c71003cb1a92ade86
android   1:676938262003:android:cf9a1c8a771211382ade86       
ios       1:676938262003:ios:def6db6287abe2d82ade86
macos     1:676938262003:ios:def6db6287abe2d82ade86
windows   1:676938262003:web:8b0319ecd3a10b352ade86
 */