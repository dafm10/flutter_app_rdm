// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_app_rdm/utils/constants.dart';

// ignore: must_be_immutable
class TextRegisterFormWidget extends StatelessWidget {
  String title;
  TextRegisterFormWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          textAlign: TextAlign.start,
          style: const TextStyle(
            fontSize: 14.0,
            color: priColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Text(
          "*",
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.red,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
