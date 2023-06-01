import 'package:flutter/material.dart';
import 'package:flutter_app_rdm/utils/utils.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class TextFieldPasswordWidget extends StatefulWidget {
  TextEditingController? controller;
  bool validator;
  TextFieldPasswordWidget({
    super.key,
    this.controller,
    required this.validator,
  });

  @override
  State<TextFieldPasswordWidget> createState() =>
      _TextFieldPasswordWidgetState();
}

class _TextFieldPasswordWidgetState extends State<TextFieldPasswordWidget> {
  bool isInvisible = true;

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
        maxLines: 1,
        controller: widget.controller,
        obscureText: isInvisible,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
          hintText: "Contraseña",
          filled: true,
          fillColor: Colors.white,
          hintStyle: const TextStyle(
            color: grayColor,
            fontSize: 16.0,
          ),
          prefixIcon: IconButton(
            onPressed: () {
              isInvisible = !isInvisible;
              setState(() {});
            },
            icon: isInvisible
                ? SvgPicture.asset(
                    "assets/icons/eye.svg",
                    colorFilter: const ColorFilter.mode(
                      grayColor,
                      BlendMode.srcIn,
                    ),
                  )
                : SvgPicture.asset(
                    "assets/icons/eye-off.svg",
                    colorFilter: const ColorFilter.mode(
                      grayColor,
                      BlendMode.srcIn,
                    ),
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
          if (!widget.validator) {
            return null;
          }
          if (value!.isEmpty) {
            return "El campo no puede estar vacío";
          }
          return null;
        },
      ),
    );
  }
}
