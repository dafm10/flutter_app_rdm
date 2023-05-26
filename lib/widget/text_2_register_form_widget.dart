import 'package:flutter/material.dart';
import 'package:flutter_app_rdm/utils/constants.dart';

// ignore: must_be_immutable
class Text2RegisterFormWidget extends StatelessWidget {
  String title;
  Text2RegisterFormWidget({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$title : ",
      textAlign: TextAlign.start,
      style: const TextStyle(
        fontSize: 14.0,
        color: priColor,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
