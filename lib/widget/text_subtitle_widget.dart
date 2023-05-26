import 'package:flutter/material.dart';
import 'package:flutter_app_rdm/utils/constants.dart';

// ignore: must_be_immutable
class TextSubtitleWidget extends StatelessWidget {
  String subTitle;
  TextSubtitleWidget({
    super.key,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Text(
        subTitle,
        textAlign: TextAlign.start,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
