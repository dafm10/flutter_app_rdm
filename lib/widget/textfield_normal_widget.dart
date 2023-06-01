import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_rdm/utils/utils.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextFieldNormalWidget extends StatelessWidget {
  String hintText;
  String icon;
  TextEditingController? controller;
  TextInputType? textInputType;
  TypeInputTextField? typeInput;
  int? maxLines;
  bool isNumeric;

  TextFieldNormalWidget({
    super.key,
    required this.hintText,
    required this.icon,
    required this.isNumeric,
    this.controller,
    this.textInputType,
    this.maxLines,
    this.typeInput,
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
        maxLength: isNumeric
            ? typeInput == TypeInputTextField.dni
                ? 8
                : 9
            : null,
        keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
        inputFormatters: isNumeric
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
          counterText: "",
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
          errorBorder: const UnderlineInputBorder(
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
          if (typeInput == TypeInputTextField.dni && value.length < 8) {
            return "El campo debe de tener 8 caracteres";
          }
          if (typeInput == TypeInputTextField.phone && value.length < 9) {
            return "El campo debe de tener 9 caracteres";
          }
          return null;
        },
      ),
    );
  }
}
