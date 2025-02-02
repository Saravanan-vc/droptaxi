import 'package:droptaxi/service/custompop.dart';
import 'package:droptaxi/service/email_service.dart';
import 'package:droptaxi/util/color_constant.dart';
import 'package:droptaxi/view/database/firebase_data.dart';
import 'package:droptaxi/view/model/from_model.dart';
import 'package:droptaxi/view/model/info_model.dart';
import 'package:droptaxi/view/model/info_services.dart';
import 'package:droptaxi/view/model/intial_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class HomeController extends GetxController {
  RxBool isTapedBooked = false.obs;
   RxBool isTapedSubmit = false.obs;
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
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
  RxList<bool> isTaped = [true, false, false].obs;
  RxMap<String, double> fromPostion = {"lat": 0.0, "long": 0.0}.obs;
  RxMap<String, double> toPostion = {"lat": 0.0, "long": 0.0}.obs;
  RxInt priceforRide = 0.obs;
  RxDouble kilometer = 0.0.obs;
  // content about services and policys
  RxString isInfoe = "About".obs;
  RxString aboutUs = "".obs;
  RxString faqs = ''.obs;
  RxString luggageCont = "".obs;
  RxString cancelCont = "".obs;
  RxString refundCont = "".obs;
  RxString contaUScont = "".obs;
  ScrollController scrollController = ScrollController();
  RxBool isEntered = false.obs;
  RxBool isBooked = false.obs;
  RxBool isMEntered = false.obs;
  RxBool isMBooked = false.obs;

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
    date: "",
    mobile: "",
    name: "",
    time: "",
  ).obs;

  RxList<FromModel> fromdrop = const [
    FromModel(
      lat: 0.0,
      location: "From",
      long: 0.0,
    )
  ].obs;
  RxList<FromModel> todrop = const [
    FromModel(
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

  Rx<InfoServices> information = const InfoServices(
          addressInfo: "", emailInfo: "", mobileNumber: 0, whatsAppNumber: 0)
      .obs;

  void caluclation(Map from, Map to) {
    double rawGeolocatorMiter = Geolocator.distanceBetween(
        from['lat'], from['long'], to['lat'], to['long']);
    double distanceInKilometers = rawGeolocatorMiter / 1000;
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

  Future<void> getInfomation() async {
    List data = await FirebaseDataClass().getInfo();

    data.forEach((element) {
      information.value = InfoServices.fromJson(element.data());
    });
    information.value = InfoServices.fromJson(data[0].data());
  }

  Future<void> contentDeclared() async {
    String content = await rootBundle.loadString("assets/footer.txt");

    int about = content.indexOf('About Us:');
    int faq = content.indexOf('FAQs:');
    int luggage = content.indexOf('Luggage Policy:');
    int cancellation = content.indexOf('Cancellation Policy:');
    int refund = content.indexOf('Refund Policy:');
    int contatus = content.indexOf('Contact us');
    int remove = content.indexOf('Tariff:');

    aboutUs.value = content.substring(about, faq);
    faqs.value = content.substring(faq, luggage);
    luggageCont.value = content.substring(luggage, cancellation);
    cancelCont.value = content.substring(cancellation, refund);
    refundCont.value = content.substring(refund, contatus);
    contaUScont.value = content.substring(contatus, remove);
  }

  @override
  void onInit() {
    getInfomation();
    assignData();
    contentDeclared();
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

  //validation

  void validate() {
    if (infoUser.value.date.isNotEmpty &&
        infoUser.value.time.isNotEmpty &&
        infoUser.value.mobile.isNotEmpty &&
        infoUser.value.name.isNotEmpty) {
      if (infoUser.value.accept) {
        Map<String, dynamic> infoUserMap = infoUser.value.asMap();
        Map<String, dynamic> productSelctedMap = productSelcted.value.asMap();
        infoUserMap.addAll(productSelctedMap);
        EmailService.sendEmail(
          infoUser.value.time,
          infoUser.value.date,
          infoUser.value.name,
          infoUser.value.mobile,
          productSelcted.value.amout,
          productSelcted.value.service,
          productSelcted.value.car,
          productSelcted.value.from,
          productSelcted.value.to,
        );
        FirebaseDataClass().sendData(infoUserMap).then((value) {
          scrollController.animateTo(0,
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeIn);
          fromSelect.value = "From";
          toSelect.value = "To";
          isPickedBoth.value = false;
        });
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
