import 'package:droptaxi/service/custompop.dart';
import 'package:droptaxi/util/color_constant.dart';
import 'package:droptaxi/view/database/firebase_data.dart';
import 'package:droptaxi/view/model/from_model.dart';
import 'package:droptaxi/view/model/info_model.dart';
import 'package:droptaxi/view/model/intial_service.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final int basiBata = 600;
  RxBool isSinglehowver = false.obs;
  RxBool isMultihowver = false.obs;
  RxBool isPackagehowver = false.obs;
  RxString fromSelect = "From".obs;
  RxString toSelect = "To".obs;
  RxInt dropIndex = 0.obs;
  RxBool polcyAccept = false.obs;
  RxList isSelected = [true, false, false].obs;
  RxBool isPickedBoth = false.obs;
  RxList<bool> isTaped = [false, false, false].obs;
  RxMap<String, double> fromPostion = {"lat": 0.0, "long": 0.0}.obs;
  RxMap<String, double> toPostion = {"lat": 0.0, "long": 0.0}.obs;
  RxInt priceforRide = 0.obs;
  RxDouble kilometer = 0.0.obs;
  // dumy varaible set
  RxString adultsChange = "No.of Adults".obs;
  RxString chilsChange = "No.of Childs".obs;
  RxString laguageChange = "No.of Lagguages".obs;
  RxString mrorms = "Mr".obs;
  RxString getInfo = "Selecte".obs;
  // RxString date = "".obs;
  // RxString time = "".obs;
  // RxString mobilenumber = "".obs;
  // RxString alternumber = "".obs;
  // RxString name = "".obs;
  // RxString email = "".obs;
  // RxString pickup = "".obs;
  // RxString drop = "".obs;
  // RxString remark = "".obs;

  Rx<IntialServiceModel> productSelcted = IntialServiceModel(
    amout: 0,
    car: "",
    from: "",
    service: "",
    to: "",
    rounds: "",
    packages: "",
  ).obs;

  Rx<InfoModel> infoUser = InfoModel(
          accept: false,
          adults: "",
          altermobile: "",
          chils: "",
          date: "",
          fromadress: "",
          getinfo: "",
          laguggage: "",
          mobile: "",
          mrorms: "",
          remark: "",
          name: "",
          email: "",
          time: "",
          toadress: "")
      .obs;

  RxList<FromModel> fromdrop = const [
    FromModel(
      adress: "",
      lat: 0.0,
      location: "From",
      long: 0.0,
    )
  ].obs;
  RxList<FromModel> todrop = const [
    FromModel(
      adress: "",
      lat: 0.0,
      location: "To",
      long: 0.0,
    )
  ].obs;
  //change the selecte one
  void changeSelected(int selected, List isTaped) {
    for (int i = 0; i < isTaped.length; i++) {
      i == selected ? isTaped[i] = true : isTaped[i] = false;
    }
  }

  void caluclation(Map from, Map to) {
    double rawGeolocatorMiter = Geolocator.distanceBetween(
        from['lat'], from['long'], to['lat'], to['long']);
    double distanceInKilometers = rawGeolocatorMiter / 1000;
    debugPrint(
        "\u001B[33m kilometer : \u001B[35m ${distanceInKilometers.toStringAsFixed(2)}");
    kilometer.value = double.parse(distanceInKilometers.toStringAsFixed(2));
  }

  void calucaltionPrice(int carValue) {
    priceforRide.value = (kilometer.value * carValue).round() + basiBata;
    debugPrint("\u001b[33m price : \u001B[35m ${priceforRide.value}");
  }

  //get data from database
  Future<void> assignData() async {
    List data = await FirebaseDataClass().getData();
    data.forEach((element) {
      FromModel fromModel = FromModel.from(element.data());
      todrop.add(fromModel);
      fromdrop.add(fromModel);
    });
  }

  @override
  void onInit() {
    assignData();
    super.onInit();
  }

  //is roundtrip
  RxString roundTrip = "1".obs;
  List<String> listOfRound = List.generate(15, (index) => '${index + 1}');
  // package trip
  RxBool isOutstain = true.obs;
  RxString packages = "Out Station".obs;

  Future<void> pickeDate(TextEditingController controller) async {
    DateTime dateTime = DateTime.now();
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      firstDate: dateTime,
      lastDate: DateTime(dateTime.year + 10),
      initialDate: DateTime.now(),
    );
    controller.text =
        "${pickedDate!.day.toString().padLeft(2, "0")}/${pickedDate.month.toString().padLeft(2, "0")}/${pickedDate.year}";
    infoUser.value.date = controller.text;
    debugPrint(
        "\u001B[33m pickedDate : \u001B[35m ${pickedDate.day} : ${pickedDate.month.toString().padLeft(2, "0")} : ${pickedDate.year}");
  }

  Future<void> pickeTime(TextEditingController controller) async {
    TimeOfDay timeOfDay = TimeOfDay.now();
    TimeOfDay? picedTime = await showTimePicker(
      context: Get.context!,
      initialTime: timeOfDay,
    );
    controller.text =
        "${picedTime!.hour.toString().padLeft(2, "0")}:${picedTime.minute.toString().padLeft(2, "0")}";
    infoUser.value.time = controller.text;
    debugPrint("\u001B[33m Picked Time : \u001B[35m ${controller.text}");
  }

  // void manualPrint() {
  //   customePrinter("productsSelected", productSelcted.value.toString());
  //   customePrinter("UserInfo", infoUser.value.toString());
  // }

  //validation

  void validate() {
    infoUser.value.mrorms = mrorms.value;
    if (infoUser.value.date.isNotEmpty &&
        infoUser.value.time.isNotEmpty &&
        infoUser.value.adults.isNotEmpty &&
        infoUser.value.chils.isNotEmpty &&
        infoUser.value.laguggage.isNotEmpty &&
        infoUser.value.mobile.isNotEmpty &&
        infoUser.value.altermobile.isNotEmpty &&
        infoUser.value.email.isNotEmpty &&
        infoUser.value.name.isNotEmpty &&
        infoUser.value.fromadress.isNotEmpty &&
        infoUser.value.toadress.isNotEmpty &&
        infoUser.value.remark.isNotEmpty &&
        infoUser.value.getinfo.isNotEmpty) {
      if (infoUser.value.accept) {
        Map<String, dynamic> infoUserMap = infoUser.value.asMap();
        Map<String, dynamic> productSelctedMap = productSelcted.value.asMap();
        infoUserMap.addAll(productSelctedMap);
        FirebaseDataClass().sendData(infoUserMap);
      } else {
        customPOPmsg("Please Accepte the condition", ColorConstant.thirdColor);
      }
    } else {
      infoUser.value.asMap().forEach((key, value) {
        if (key == "Accepte") {
        } else {
          if (value.isEmpty) {
            debugPrint("$value:$key");
            customPOPmsg(key, ColorConstant.thirdColor);
          }
        }
      });
    }
  }
}

// debug Print its global printer

void customePrinter(String key, String value) =>
    debugPrint("\u001B[33m $key : \u001B[35m $value");
