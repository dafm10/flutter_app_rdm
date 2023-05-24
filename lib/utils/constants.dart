import 'package:flutter/material.dart';

const Color priColor = Color(0xff023E8A);
const Color grayColor = Color(0xffA6A6A6);
const Color greenColor = Color(0xffA7D140);
const Color purpleColor = Color(0xffE9268E);

const double defaultPadding = 16.0;
const double defaultBorderRadius = 12.0;

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
