import 'package:droptaxi/service/responsive_service.dart';
import 'package:droptaxi/util/dimensions.dart';
import 'package:droptaxi/view/controller/home_controller.dart';
import 'package:droptaxi/view/widget/booking_widget/textformfiled.dart';
import 'package:droptaxi/view/widget/home_widget/book_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FromView extends StatelessWidget {
  const FromView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController =
        Get.find<HomeController>(tag: 'homecontroller');
    TextEditingController dateController = TextEditingController();
    TextEditingController timeController = TextEditingController();
    TextEditingController mobileController = TextEditingController();
    // TextEditingController alterController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    // TextEditingController emailController = TextEditingController();
    // TextEditingController pickeupcontroller = TextEditingController();
    // TextEditingController dropcontroller = TextEditingController();
    // TextEditingController remarkcontroller = TextEditingController();
    return Obx(
      () => !ResponsiveService.isMobel(context)
          ? Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.paddingSizeExtraOverLarge),
              width: 875,
              margin: const EdgeInsets.only(top: 25),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: SizedBox(
                height: 400,
                width: 750,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Picke Date"),
                              const SizedBox(height: 8),
                              PickdateAndtime(
                                controller: dateController,
                                labeltext: "DD/MM/YYYY",
                                ontap: () {
                                  homeController.pickeDate(dateController);
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Picke Time"),
                              const SizedBox(height: 8),
                              PickdateAndtime(
                                controller: timeController,
                                labeltext: "HH:MM",
                                ontap: () {
                                  homeController.pickeTime(timeController);
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Row(
                    //   children: [
                    //     Flexible(
                    //       child: Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           const Text("No Of Adults"),
                    //           const SizedBox(height: 8),
                    //           InputDropButton(
                    //               value: homeController.adultsChange.value,
                    //               items: const [
                    //                 'No.of Adults',
                    //                 '1 ',
                    //                 '2',
                    //                 '3',
                    //                 '4',
                    //                 '5',
                    //                 '6',
                    //                 '7'
                    //               ],
                    //               onchange: (value) {
                    //                 homeController.adultsChange.value =
                    //                     value.toString();
                    //                 homeController.infoUser.value.adults =
                    //                     value.toString();
                    //                 homeController.update();
                    //                 debugPrint(
                    //                     '\u001B[33m PickedAdults : \u001B[35m ${homeController.infoUser.value.adults}');
                    //               }),
                    //         ],
                    //       ),
                    //     ),
                    //     const SizedBox(width: 10),
                    //     Flexible(
                    //       child: Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           const Text("No.of Childs"),
                    //           const SizedBox(height: 8),
                    //           InputDropButton(
                    //               value: homeController.chilsChange.value,
                    //               items: const [
                    //                 'No.of Childs',
                    //                 '1 ',
                    //                 '2',
                    //                 '3',
                    //                 '4',
                    //                 '5',
                    //                 '6',
                    //                 '7'
                    //               ],
                    //               onchange: (value) {
                    //                 homeController.chilsChange.value =
                    //                     value.toString();
                    //                 homeController.infoUser.value.chils =
                    //                     value.toString();
                    //                 debugPrint(
                    //                     '\u001B[33m PickedChils : \u001B[35m ${homeController.infoUser.value.chils}');
                    //               }),
                    //         ],
                    //       ),
                    //     ),
                    //     const SizedBox(width: 10),
                    //     Flexible(
                    //       child: Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           const Text("No.of Lagguages"),
                    //           const SizedBox(height: 8),
                    //           InputDropButton(
                    //               value: homeController.laguageChange.value,
                    //               items: const [
                    //                 'No.of Lagguages',
                    //                 '1 ',
                    //                 '2',
                    //                 '3',
                    //                 '4',
                    //                 '5',
                    //                 '6',
                    //                 '7'
                    //               ],
                    //               onchange: (value) {
                    //                 homeController.laguageChange.value =
                    //                     value.toString();
                    //                 homeController.infoUser.value.laguggage =
                    //                     value.toString();
                    //                 debugPrint(
                    //                     '\u001B[33m Pickedlaguagge : \u001B[35m ${homeController.infoUser.value.laguggage}');
                    //               })
                    //         ],
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // const SizedBox(height: 20),
                    Row(
                      children: [
                        Flexible(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Mobile Number *"),
                              const SizedBox(height: 10),
                              TextInputForm(
                                maxLength: 10,
                                labeltext: '12345*****',
                                textInputType: TextInputType.number,
                                controller: mobileController,
                                onChange: (value) {
                                  homeController.infoUser.value.mobile =
                                      mobileController.text;
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Enter Name *"),
                              const SizedBox(height: 10),
                              TextInputForm(
                                maxLength: 50,
                                labeltext: 'Name',
                                textInputType: TextInputType.text,
                                controller: nameController,
                                onChange: (value) {
                                  homeController.infoUser.value.name =
                                      nameController.text;
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // const SizedBox(height: 20),
                    // Row(
                    //   children: [
                    //     SizedBox(
                    //       width: 80,
                    //       child: Column(
                    //         mainAxisSize: MainAxisSize.min,
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           const Text("Mr/Ms *"),
                    //           const SizedBox(height: 10),
                    //           InputDropButton(
                    //               value: homeController.mrorms.value,
                    //               items: const ['Mr', 'Ms'],
                    //               onchange: (value) {
                    //                 homeController.mrorms.value =
                    //                     value.toString();
                    //                 homeController.infoUser.value.mrorms =
                    //                     value.toString();
                    //                 debugPrint(
                    //                     "\u001B Mr Or Ms : ${homeController.infoUser.value.mrorms}");
                    //               }),
                    //         ],
                    //       ),
                    //     ),
                    //     const SizedBox(width: 10),
                    //     Flexible(
                    //       child: Column(
                    //         mainAxisSize: MainAxisSize.min,
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           const Text("Enter Name *"),
                    //           const SizedBox(height: 10),
                    //           TextInputForm(
                    //             maxLength: 50,
                    //             labeltext: 'Name',
                    //             textInputType: TextInputType.number,
                    //             controller: nameController,
                    //             onChange: (value) {
                    //               homeController.infoUser.value.name =
                    //                   nameController.text;
                    //             },
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //     const SizedBox(width: 10),
                    //     Flexible(
                    //       child: Column(
                    //         mainAxisSize: MainAxisSize.min,
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           const Text("E-mail *"),
                    //           const SizedBox(height: 10),
                    //           TextInputForm(
                    //             maxLength: 50,
                    //             labeltext: 'E-mail',
                    //             textInputType: TextInputType.number,
                    //             controller: emailController,
                    //             onChange: (value) {
                    //               homeController.infoUser.value.email =
                    //                   emailController.text;
                    //             },
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // const SizedBox(height: 20),
                    // Row(
                    //   children: [
                    //     Flexible(
                    //       child: Column(
                    //         mainAxisSize: MainAxisSize.min,
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           const Text("Picke-up addres *"),
                    //           const SizedBox(height: 10),
                    //           PargrapText(
                    //             textEditingController: pickeupcontroller,
                    //             onChange: (value) {
                    //               homeController.infoUser.value.fromadress =
                    //                   value.toString();
                    //             },
                    //             lable: "Pick up-address",
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //     const SizedBox(width: 10),
                    //     Flexible(
                    //       child: Column(
                    //         mainAxisSize: MainAxisSize.min,
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           const Text("Drop address *"),
                    //           const SizedBox(height: 10),
                    //           PargrapText(
                    //             textEditingController: dropcontroller,
                    //             onChange: (value) {
                    //               homeController.infoUser.value.toadress =
                    //                   value.toString();
                    //             },
                    //             lable: "Drop-address",
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // const SizedBox(height: 20),
                    // Flexible(
                    //   child: Column(
                    //     mainAxisSize: MainAxisSize.min,
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       const Text("Re-Mark *"),
                    //       const SizedBox(height: 10),
                    //       PargrapText(
                    //         textEditingController: remarkcontroller,
                    //         onChange: (value) {
                    //           homeController.infoUser.value.remark =
                    //               value.toString();
                    //         },
                    //         lable: "Re-Mark",
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    const SizedBox(height: 20),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     SizedBox(
                    //       width: 400,
                    //       child: Column(
                    //         mainAxisSize: MainAxisSize.min,
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           const Text(
                    //               "How did you come to know about Droptaxi? "),
                    //           const SizedBox(height: 10),
                    //           SizedBox(
                    //             width: ResponsiveService.isMobel(context)
                    //                 ? MediaQuery.sizeOf(context).width * 0.8
                    //                 : null,
                    //             child: InputDropButton(
                    //                 value: homeController.getInfo.value,
                    //                 items: const [
                    //                   'Selecte',
                    //                   'Instagram',
                    //                   'Facebook',
                    //                   'Whatsapp',
                    //                   'Media',
                    //                   'Youtub',
                    //                   'Linked',
                    //                 ],
                    //                 onchange: (value) {
                    //                   homeController.getInfo.value =
                    //                       value.toString();
                    //                   homeController.infoUser.value.getinfo =
                    //                       value.toString();
                    //                   debugPrint(
                    //                       "\u001B selectedINFO : ${homeController.infoUser.value.getinfo}");
                    //                 }),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(height: 20),
                    PackageButton(
                      text: "Submit",
                      ontap: () {
                        homeController.validate();
                        homeController.fromController.clear();
                        homeController.toController.clear();
                      },
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Checkbox(
                            value: homeController.polcyAccept.value,
                            onChanged: (value) {
                              homeController.polcyAccept.value =
                                  !homeController.polcyAccept.value;
                              homeController.infoUser.value.accept = value!;
                            }),
                        const Text("I accept the Terms and Conditions.")
                      ],
                    )
                  ],
                ),
              ),
            )
          : Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.paddingSizeSmall),
              width: 875,
              margin: const EdgeInsets.only(top: 25),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: SizedBox(
                width: 750,
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Picke Date"),
                        PickdateAndtime(
                          controller: dateController,
                          labeltext: "DD/MM/YYYY",
                          ontap: () {
                            homeController.pickeDate(dateController);
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Picke Time"),
                        PickdateAndtime(
                          controller: timeController,
                          labeltext: "HH:MM",
                          ontap: () {
                            homeController.pickeTime(timeController);
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     const Text("No Of Adults"),
                    //     const SizedBox(height: 8),
                    //     InputDropButton(
                    //         value: "No.of Adults",
                    //         items: const [
                    //           'No.of Adults',
                    //           '1 ',
                    //           '2',
                    //           '3',
                    //           '4',
                    //           '5',
                    //           '6',
                    //           '7'
                    //         ],
                    //         onchange: (value) {}),
                    //   ],
                    // ),
                    // const SizedBox(height: 10),
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     const Text("No.of Childs"),
                    //     const SizedBox(height: 8),
                    //     InputDropButton(
                    //         value: "No.of Childs",
                    //         items: const [
                    //           'No.of Childs',
                    //           '1 ',
                    //           '2',
                    //           '3',
                    //           '4',
                    //           '5',
                    //           '6',
                    //           '7'
                    //         ],
                    //         onchange: (value) {}),
                    //   ],
                    // ),
                    // const SizedBox(height: 10),
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     const Text("No.of Lagguages"),
                    //     const SizedBox(height: 8),
                    //     InputDropButton(
                    //         value: "No.of Lagguages",
                    //         items: const [
                    //           'No.of Lagguages',
                    //           '1 ',
                    //           '2',
                    //           '3',
                    //           '4',
                    //           '5',
                    //           '6',
                    //           '7'
                    //         ],
                    //         onchange: (value) {})
                    //   ],
                    // ),
                    // const SizedBox(height: 10),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Mobile Number *"),
                        const SizedBox(height: 10),
                        TextInputForm(
                          maxLength: 10,
                          labeltext: '98653*****',
                          textInputType: TextInputType.number,
                          controller: mobileController,
                          onChange: (value) {
                            homeController.infoUser.value.mobile =
                                mobileController.text;
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // Column(
                    //   mainAxisSize: MainAxisSize.min,
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     const Text("Alternative Number *"),
                    //     const SizedBox(height: 10),
                    //     TextInputForm(
                    //       maxLength: 10,
                    //       labeltext: '98653*****',
                    //       textInputType: TextInputType.number,
                    //       controller: alterController,
                    //       onChange: (value) {
                    //         homeController.infoUser.value.altermobile =
                    //             alterController.text;
                    //       },
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(height: 10),
                    // Row(
                    //   children: [
                    //     SizedBox(
                    //       width: 80,
                    //       child: Column(
                    //         mainAxisSize: MainAxisSize.min,
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           const Text("Mr/Ms *"),
                    //           const SizedBox(height: 10),
                    //           InputDropButton(
                    //               value: "Mr",
                    //               items: const ['Mr', 'Ms'],
                    //               onchange: (value) {
                    //                 homeController.infoUser.value.mrorms =
                    //                     value.toString();
                    //               }),
                    //         ],
                    //       ),
                    //     ),
                    //     const SizedBox(width: 10),
                    //     Flexible(
                    //       child:
                    //     ),
                    //   ],
                    // ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Enter Name *"),
                        const SizedBox(height: 10),
                        TextInputForm(
                          maxLength: 50,
                          labeltext: 'Name',
                          textInputType: TextInputType.text,
                          controller: nameController,
                          onChange: (value) {
                            homeController.infoUser.value.name =
                                nameController.text;
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // Column(
                    //   mainAxisSize: MainAxisSize.min,
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     const Text("E-mail *"),
                    //     const SizedBox(height: 10),
                    //     TextInputForm(
                    //       maxLength: 50,
                    //       labeltext: 'E-mail',
                    //       textInputType: TextInputType.number,
                    //       controller: emailController,
                    //       onChange: (value) {
                    //         homeController.infoUser.value.email =
                    //             emailController.text;
                    //       },
                    //     ),
                    //   ],
                    // ),
                    // const SizedBox(height: 10),
                    // Column(
                    //   mainAxisSize: MainAxisSize.min,
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     const Text("Picke-up addres *"),
                    //     const SizedBox(height: 10),
                    //     PargrapText(
                    //       textEditingController: pickeupcontroller,
                    //       onChange: (value) {
                    //         homeController.infoUser.value.fromadress =
                    //             value.toString();
                    //       },
                    //       lable: "Pick up-address",
                    //     ),
                    //   ],
                    // ),
                    // const SizedBox(height: 10),
                    // Column(
                    //   mainAxisSize: MainAxisSize.min,
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     const Text("Drop address *"),
                    //     const SizedBox(height: 10),
                    //     PargrapText(
                    //       textEditingController: dropcontroller,
                    //       onChange: (value) {
                    //         homeController.infoUser.value.toadress =
                    //             value.toString();
                    //       },
                    //       lable: "Drop-address",
                    //     ),
                    //   ],
                    // ),
                    // const SizedBox(height: 10),
                    // Column(
                    //   mainAxisSize: MainAxisSize.min,
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     const Text("Re-Mark *"),
                    //     const SizedBox(height: 10),
                    //     PargrapText(
                    //       textEditingController: remarkcontroller,
                    //       onChange: (value) {
                    //         homeController.infoUser.value.remark =
                    //             value.toString();
                    //       },
                    //       lable: "Re-Mark",
                    //     ),
                    //   ],
                    // ),
                    // const SizedBox(height: 10),
                    // Column(
                    //   mainAxisSize: MainAxisSize.min,
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     const Text("How did you come to know about Droptaxi? "),
                    //     const SizedBox(height: 10),
                    //     SizedBox(
                    //       width: ResponsiveService.isMobel(context)
                    //           ? MediaQuery.sizeOf(context).width * 0.8
                    //           : null,
                    //       child: InputDropButton(
                    //           value: "Selecte",
                    //           items: const [
                    //             'Selecte',
                    //             'Instagram',
                    //             'Facebook',
                    //             'Whatsapp',
                    //             'Media',
                    //             'Youtub',
                    //             'Linked',
                    //           ],
                    //           onchange: (value) {
                    //             homeController.infoUser.value.getinfo =
                    //                 value.toString();
                    //           }),
                    //     ),
                    //   ],
                    // ),
                    // const SizedBox(height: 10),
                    PackageButton(
                      text: "Submit",
                      ontap: () {
                        homeController.validate();
                        homeController.fromController.clear();
                        homeController.toController.clear();
                      },
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Checkbox(
                            value: homeController.polcyAccept.value,
                            onChanged: (value) {
                              homeController.polcyAccept.value =
                                  !homeController.polcyAccept.value;
                              homeController.infoUser.value.accept = value!;
                            }),
                        const Text("I accept the Terms and Conditions.")
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
