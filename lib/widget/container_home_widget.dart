import 'package:flutter/material.dart';
import 'package:flutter_app_rdm/utils/constants.dart';

// ignore: must_be_immutable
class ContainerHomeWidget extends StatelessWidget {
  String title;
  String subTitle;
  IconData icon;
  Color color;

  ContainerHomeWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding * 2),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        height: 101.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(color: grayColor),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 65.0,
              color: color,
            ),
            const SizedBox(width: 12.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: priColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
                Text(
                  subTitle,
                  style: const TextStyle(
                    color: grayColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
