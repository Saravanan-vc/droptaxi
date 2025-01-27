import 'package:droptaxi/util/color_constant.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showMessage(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      timeInSecForIosWeb: 1,
      gravity: ToastGravity.BOTTOM_RIGHT,
      backgroundColor: ColorConstant.thirdColor,
      textColor: ColorConstant.secondayColor,
      webShowClose: true,
      toastLength: Toast.LENGTH_SHORT,
      webPosition: "bottom");
}
