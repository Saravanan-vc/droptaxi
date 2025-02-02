import 'package:droptaxi/service/responsive_service.dart';
import 'package:droptaxi/service/textstyle_service.dart';
import 'package:droptaxi/util/color_constant.dart';
import 'package:droptaxi/util/dimensions.dart';
import 'package:droptaxi/view/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DropdownWidget extends StatelessWidget {
  const DropdownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController =
        Get.find<HomeController>(tag: 'homecontroller');
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // "From" Location TypeAheadField
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.4,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12, spreadRadius: 1, blurRadius: 20),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: TypeAheadField(
                controller: homeController.fromController,
                suggestionsCallback: (pattern) async {
                  return await getLocationSuggestions(pattern);
                },
                itemBuilder: (context, suggestion) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text(
                            suggestion['description'] ?? "No location found"),
                      ),
                      const SizedBox(height: 8),
                      Divider(
                        color: Colors.grey[200],
                        indent: 0,
                        endIndent: 0,
                      ),
                    ],
                  );
                },
                onSelected: (suggestion) async {
                  debugPrint("suggestiononon :${suggestion.toString()}");
                  homeController.fromSelect.value = suggestion['description'];
                  homeController.fromController.text =
                      suggestion['description'];
                  var location = await getPlaceDetails(suggestion['place_id']);
                  debugPrint("\u001B[40m locationff : \u001B[38m $location");
                  if (location.isNotEmpty) {
                    homeController.fromPostion.value = {
                      "lat": location['lat'],
                      "long": location['lng'],
                    };
                    homeController.caluclation(
                        homeController.fromPostion, homeController.toPostion);
                    homeController.calucaltionPrice(14);
                  }
                },
                builder: (context, fromController, focusNode) {
                  // fromController.text = homeController.fromController.text;
                  return TextField(
                    controller: fromController,
                    focusNode: focusNode,
                    decoration: InputDecoration(
                      hintText: homeController.fromSelect.value,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 10),
                    ),
                  );
                },
              ),
            ),
          ),
        ),

        // "To" Location TypeAheadField
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.4,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12, spreadRadius: 1, blurRadius: 20),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: TypeAheadField(
                controller: homeController.toController,
                suggestionsCallback: (pattern) async {
                  return await getLocationSuggestions(pattern);
                },
                itemBuilder: (context, suggestion) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text(
                            suggestion['description'] ?? "No location found"),
                      ),
                      const SizedBox(height: 8),
                      Divider(
                        color: Colors.grey[200],
                        indent: 0,
                        endIndent: 0,
                      ),
                    ],
                  );
                },
                onSelected: (suggestion) async {
                  homeController.toSelect.value = suggestion['description'];
                  homeController.toController.text = suggestion['description'];
                  var location = await getPlaceDetails(suggestion['place_id']);
                  if (location.isNotEmpty) {
                    homeController.toPostion.value = {
                      "lat": location['lat'],
                      "long": location['lng'],
                    };
                    homeController.caluclation(
                        homeController.fromPostion, homeController.toPostion);
                    homeController.calucaltionPrice(14);
                  }
                },
                builder: (context, controller, focusNode) {
                  return TextField(
                    controller: controller,
                    focusNode: focusNode,
                    decoration: InputDecoration(
                      hintText: homeController.toSelect.value,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 10),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DropdownWidgetRoundTrip extends StatelessWidget {
  const DropdownWidgetRoundTrip({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController =
        Get.find<HomeController>(tag: 'homecontroller');
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: ResponsiveService.isMobel(context)
                ? MediaQuery.sizeOf(context).width * 0.4
                : MediaQuery.sizeOf(context).width * 0.3,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12, spreadRadius: 1, blurRadius: 20)
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: DropdownButton<String>(
                  hint: const Text('Number of Trips'),
                  padding: const EdgeInsets.symmetric(
                      horizontal: Dimensions.paddingSizeDefault),
                  isExpanded: true,
                  borderRadius: BorderRadius.circular(6),
                  underline: const SizedBox(),
                  value: homeController.roundTrip.value,
                  items: homeController.listOfRound
                      .map((e) => DropdownMenuItem<String>(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  onChanged: (selected) {
                    if (selected != null) {
                      homeController.roundTrip.value = selected;
                    }
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: ResponsiveService.isMobel(context)
                    ? MediaQuery.sizeOf(context).width * 0.4
                    : MediaQuery.sizeOf(context).width * 0.3,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 1,
                          blurRadius: 20)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: TypeAheadField(
                      suggestionsCallback: (pattern) async {
                        return await getLocationSuggestions(pattern);
                      },
                      itemBuilder: (context, suggestion) {
                        return Column(
                          children: [
                            ListTile(
                              title: Text(suggestion['description'] ??
                                  "No location found"),
                            ),
                            const SizedBox(height: 8),
                            Divider(
                              color: Colors.grey[200],
                              indent: 0,
                              endIndent: 0,
                            ),
                          ],
                        );
                      },
                      onSelected: (suggestion) async {
                        debugPrint("suggestiononon :${suggestion.toString()}");
                        homeController.fromSelect.value =
                            suggestion['description'];
                        var location =
                            await getPlaceDetails(suggestion['place_id']);
                        debugPrint(
                            "\u001B[40m locationff : \u001B[38m $location");
                        if (location.isNotEmpty) {
                          homeController.fromPostion.value = {
                            "lat": location['lat'],
                            "long": location['lng'],
                          };
                        }
                      },
                      builder: (context, controller, focusNode) {
                        return TextField(
                          controller: controller,
                          focusNode: focusNode,
                          decoration: InputDecoration(
                            hintText: 'From Location',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 10),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              // "To" Location Dropdown
              SizedBox(
                width: ResponsiveService.isMobel(context)
                    ? MediaQuery.sizeOf(context).width * 0.4
                    : MediaQuery.sizeOf(context).width * 0.3,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 1,
                          blurRadius: 20)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: TypeAheadField(
                      suggestionsCallback: (pattern) async {
                        return await getLocationSuggestions(pattern);
                      },
                      itemBuilder: (context, suggestion) {
                        return Column(
                          children: [
                            ListTile(
                              title: Text(suggestion['description'] ??
                                  "No location found"),
                            ),
                            const SizedBox(height: 8),
                            Divider(
                              color: Colors.grey[200],
                              indent: 0,
                              endIndent: 0,
                            ),
                          ],
                        );
                      },
                      onSelected: (suggestion) async {
                        homeController.toSelect.value =
                            suggestion['description'];
                        var location =
                            await getPlaceDetails(suggestion['place_id']);
                        if (location.isNotEmpty) {
                          homeController.toPostion.value = {
                            "lat": location['lat'],
                            "long": location['lng'],
                          };
                        }
                      },
                      builder: (context, controller, focusNode) {
                        return TextField(
                          controller: controller,
                          focusNode: focusNode,
                          decoration: InputDecoration(
                            hintText: 'To Location',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 10),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DropdownWidgetPackageTrip extends StatelessWidget {
  const DropdownWidgetPackageTrip({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("${MediaQuery.sizeOf(context).width / 1.4}");
    HomeController homeController =
        Get.find<HomeController>(tag: 'homecontroller');
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Container(
            height: 45,
            width: ResponsiveService.isMobel(context)
                ? ResponsiveService.isRealMobel(context)
                    ? MediaQuery.sizeOf(context).width - 20
                    : MediaQuery.sizeOf(context).width / 1.4
                : 355.528,
            decoration: BoxDecoration(
                border: Border.all(width: 1.2, color: ColorConstant.thirdColor),
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Obx(() => GestureDetector(
                      onTap: () {
                        homeController.isOutstain.value =
                            !homeController.isOutstain.value;
                        homeController.packages.value = "Out Station";
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal:
                                Dimensions.paddingSizeExtremeLarge + 22),
                        margin: const EdgeInsets.only(left: 2, right: 2),
                        height: 40,
                        decoration: BoxDecoration(
                            color: homeController.isOutstain.value
                                ? ColorConstant.baseColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                            child: Text(
                          "Out Station",
                          style: TextstyleService.tabBar().copyWith(
                            color: homeController.isOutstain.value
                                ? ColorConstant.secondayColor
                                : ColorConstant.baseColor,
                          ),
                        )),
                      ),
                    )),
                Obx(() => GestureDetector(
                      onTap: () {
                        homeController.isOutstain.value =
                            !homeController.isOutstain.value;
                        homeController.packages.value = "local";
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal:
                                Dimensions.paddingSizeExtremeLarge + 22),
                        margin: const EdgeInsets.only(right: 2, left: 2),
                        height: 40,
                        decoration: BoxDecoration(
                            color: homeController.isOutstain.value
                                ? Colors.transparent
                                : ColorConstant.baseColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                            child: Text(
                          "Local",
                          style: TextstyleService.tabBar().copyWith(
                              color: homeController.isOutstain.value
                                  ? ColorConstant.baseColor
                                  : ColorConstant.secondayColor),
                        )),
                      ),
                    ))
              ],
            ),
          )),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: ResponsiveService.isMobel(context)
                    ? MediaQuery.sizeOf(context).width * 0.4
                    : MediaQuery.sizeOf(context).width * 0.3,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 1,
                          blurRadius: 20)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: DropdownButton<String>(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Dimensions.paddingSizeDefault),
                      isExpanded: true,
                      borderRadius: BorderRadius.circular(6),
                      underline: const SizedBox(),
                      value: homeController.fromSelect.value,
                      items: homeController.fromdrop
                          .map((e) => DropdownMenuItem<String>(
                                value: e.location,
                                child: Text(e.location),
                              ))
                          .toList(),
                      onChanged: (selected) {
                        debugPrint("\u001B[33m selected : \u001B[35m$selected");
                        if (selected != null) {
                          for (var value in homeController.fromdrop) {
                            value.location == selected
                                ? homeController.fromPostion.value = {
                                    "lat": value.lat,
                                    "long": value.long
                                  }
                                : null;
                          }
                          if (homeController.toSelect.value != "To") {
                            homeController.caluclation(
                                homeController.fromPostion,
                                homeController.toPostion);
                            debugPrint('toSelect');
                          }
                          homeController.fromSelect.value = selected.tr;
                        }
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: ResponsiveService.isMobel(context)
                    ? MediaQuery.sizeOf(context).width * 0.4
                    : MediaQuery.sizeOf(context).width * 0.3,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 1,
                          blurRadius: 20)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: DropdownButton<String>(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Dimensions.paddingSizeDefault),
                      isExpanded: true,
                      borderRadius: BorderRadius.circular(6),
                      underline: const SizedBox(),
                      value: homeController.toSelect.value,
                      items: homeController.todrop
                          .map((e) => DropdownMenuItem<String>(
                                value: e.location,
                                child: Text(e.location),
                              ))
                          .toList(),
                      onChanged: (selected) {
                        if (selected != null &&
                            homeController.fromSelect.value != selected) {
                          for (var value in homeController.todrop) {
                            value.location == selected
                                ? homeController.toPostion.value = {
                                    "lat": value.lat,
                                    "long": value.long
                                  }
                                : null;
                          }
                          if (homeController.fromSelect.value != "From") {
                            // debugPrint(homeController.fromPostion.toString());
                            // debugPrint(homeController.toPostion.toString());

                            homeController.caluclation(
                                homeController.fromPostion,
                                homeController.toPostion);
                            debugPrint('fromselect');
                          }
                          homeController.toSelect.value = selected.tr;
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

const List<Widget> tapBarList = [
  DropdownWidget(),
  DropdownWidgetRoundTrip(),
  DropdownWidgetPackageTrip()
];

class AlldropdownButton extends StatelessWidget {
  const AlldropdownButton({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController =
        Get.find<HomeController>(tag: 'homecontroller');
    return Obx(() => tapBarList[homeController.dropIndex.value]);
  }
}

Future<List<Map<String, dynamic>>> getLocationSuggestions(String query) async {
  final url =
      "https://router-mjqqnn3geq-uc.a.run.app/google?type=autocomplete&input=$query";

  try {
    final response = await http.get(Uri.parse(url));

    print("Response: ${response.body}");

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      if (data["status"] == "OK") {
        return data["predictions"].map<Map<String, dynamic>>((place) {
          return {
            "description": place["description"],
            "place_id": place["place_id"],
          };
        }).toList();
      }
    }
  } catch (e) {
    print("Error fetching location suggestions: $e");
  }
  return [];
}

Future<Map<String, dynamic>> getPlaceDetails(String placeId) async {
  final url =
      "https://router-mjqqnn3geq-uc.a.run.app/google?type=details&place_id=$placeId";

  try {
    final response = await http.get(Uri.parse(url));

    print("Place Details Response: ${response.body}");

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data["status"] == "OK") {
        debugPrint("\u001B[33m data : \u001B[35m $data");
        return {
          "lat": data["result"]["geometry"]["location"]["lat"],
          "lng": data["result"]["geometry"]["location"]["lng"],
        };
      }
    }
  } catch (e) {
    print("Error fetching place details: $e");
  }
  return {};
}
