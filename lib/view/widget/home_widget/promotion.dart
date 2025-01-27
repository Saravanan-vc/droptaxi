// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:droptaxi/service/responsive_service.dart';
import 'package:flutter/material.dart';

import 'package:droptaxi/service/textstyle_service.dart';
import 'package:droptaxi/util/color_constant.dart';

class Promotion extends StatelessWidget {
  const Promotion({super.key});

  @override
  Widget build(BuildContext context) {
    return !ResponsiveService.isMobel(context)
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'DOWNLOAD OUR APP NOW!',
                      style: TextstyleService.bold(),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                        "Enter the mobile number. We'll send you the link of our app.",
                        textAlign: TextAlign.center),
                    const SizedBox(height: 10),
                    SizedBox(
                        height: 40,
                        width: 300,
                        child: TextFromfieldnumber(
                            controller: TextEditingController())),
                    const SizedBox(height: 10),
                    const PromoButton(),
                    Text("or", style: TextstyleService.bold()),
                    const SizedBox(height: 5),
                    const Text("playstore"),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      width: 350,
                      child: Text(
                        '"Punctual drivers and prompt service. Tariff are reasonable. Passenger safety ensured. Had nice experience with droptaxi."',
                        textAlign: TextAlign.center,
                        style: TextstyleService.tabBar(),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              )
            ],
          )
        : Column(
            children: [
              const SizedBox(height: 10),
              Text(
                'DOWNLOAD OUR APP NOW!',
                style: TextstyleService.bold(),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                  "Enter the mobile number. We'll send you the link of our app.",
                  textAlign: TextAlign.center),
              const SizedBox(height: 10),
              SizedBox(
                  height: 40,
                  width: 300,
                  child:
                      TextFromfieldnumber(controller: TextEditingController())),
              const SizedBox(height: 10),
              const PromoButton(),
              const SizedBox(height: 5),
              Text("or", style: TextstyleService.bold()),
              const SizedBox(height: 5),
              const Text("playstore"),
              const SizedBox(height: 30),
              SizedBox(
                width: 350,
                child: Text(
                  '"Punctual drivers and prompt service. Tariff are reasonable. Passenger safety ensured. Had nice experience with droptaxi."',
                  textAlign: TextAlign.center,
                  style: TextstyleService.tabBar(),
                ),
              ),
              const SizedBox(height: 10),
            ],
          );
  }
}

class TextFromfieldnumber extends StatelessWidget {
  final TextEditingController controller;
  const TextFromfieldnumber({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(
          border: OutlineInputBorder(), label: Text("91+"), counterText: ""),
      maxLength: 10,
    );
  }
}

class PromoButton extends StatelessWidget {
  const PromoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 150,
      decoration: BoxDecoration(
          color: ColorConstant.baseColor,
          borderRadius: BorderRadius.circular(8)),
      child: const Center(
        child: Text(
          'Send',
          style: TextStyle(color: ColorConstant.secondayColor),
        ),
      ),
    );
  }
}
