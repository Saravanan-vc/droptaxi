// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:droptaxi/util/color_constant.dart';
import 'package:droptaxi/util/dimensions.dart';
import 'package:flutter/material.dart';

class PickdateAndtime extends StatelessWidget {
  final String labeltext;
  final TextEditingController controller;
  final Function() ontap;
  const PickdateAndtime({
    super.key,
    required this.ontap,
    required this.controller,
    required this.labeltext,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextFormField(
        readOnly: true,
        mouseCursor: SystemMouseCursors.click,
        controller: controller,
        decoration: InputDecoration(
          labelText: labeltext,
          border: const OutlineInputBorder(),
        ),
        onTap: ontap,
        keyboardType: TextInputType.none,
      ),
    );
  }
}

class TextInputForm extends StatelessWidget {
  final int maxLength;
  final TextEditingController controller;
  final TextInputType textInputType;
  final String labeltext;
  final Function(String?) onChange;
  const TextInputForm(
      {super.key,
      required this.maxLength,
      required this.labeltext,
      required this.textInputType,
      required this.controller, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextFormField(
        maxLength: maxLength,
        controller: controller,
        keyboardType: textInputType,
        decoration: InputDecoration(
          labelText: labeltext,
          counterText: "",
          border: const OutlineInputBorder(),
        ),
        onChanged:onChange,
      ),
    );
  }
}

class InputDropButton extends StatelessWidget {
  final List items;
  final String value;
  final Function(Object?)? onchange;
  const InputDropButton(
      {super.key,
      required this.value,
      required this.items,
      required this.onchange});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.8,
          color: ColorConstant.baseColor.withOpacity(0.8),
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButton(
        padding:
            const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
        isExpanded: true,
        hint: const Text("data"),
        borderRadius: BorderRadius.circular(5),
        underline: const SizedBox(),
        value: value,
        items: items
            .map((e) => DropdownMenuItem(value: e, child: Text(e)))
            .toList(),
        onChanged: onchange,
      ),
    );
  }
}

class PargrapText extends StatelessWidget {
  final String lable;
  final TextEditingController textEditingController;
  final Function(Object?) onChange;
  const PargrapText(
      {super.key, required this.lable, required this.textEditingController, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        controller: textEditingController,
        maxLines: 3,
        decoration: InputDecoration(
          labelText: lable,
          border: const OutlineInputBorder(),
        ),
        onChanged:onChange ,
      ),
    );
  }
}
