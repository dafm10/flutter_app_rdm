import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_rdm/utils/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextFieldNormalWidget extends StatelessWidget {
  final String hintText;
  final String icon;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final int? maxLines;
  final bool? isNumeric;

  TextFieldNormalWidget({
    required this.hintText,
    required this.icon,
    this.controller,
    this.textInputType,
    this.maxLines,
    this.isNumeric,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: grayColor.withOpacity(0.08),
          offset: const Offset(4, 4),
          blurRadius: 12.0,
        ),
      ]),
      child: TextFormField(
        maxLines: maxLines,
        controller: controller,
        keyboardType: textInputType,
        inputFormatters: isNumeric != null
            ? [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
              ]
            : [],
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: grayColor,
            fontSize: 16.0,
          ),
          filled: true,
          fillColor: Colors.white,
          prefixIcon: SvgPicture.asset(
            "assets/icons/$icon.svg",
            height: 20.0,
            fit: BoxFit.scaleDown,
            colorFilter: const ColorFilter.mode(
              grayColor,
              BlendMode.srcIn,
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              width: 1.0,
              color: grayColor,
              style: BorderStyle.solid,
            ),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              width: 1.0,
              color: grayColor,
              style: BorderStyle.solid,
            ),
          ),
          focusedErrorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              width: 1.0,
              color: grayColor,
              style: BorderStyle.solid,
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 1.0,
              color: grayColor,
              style: BorderStyle.solid,
            ),
          ),
        ),
        validator: (String? value) {
          if (value!.isEmpty) {
            return "El campo no puede estar vacío";
          }
          return null;
        },
      ),
    );
  }
}
