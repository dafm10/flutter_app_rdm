import 'package:flutter/material.dart';
import 'package:flutter_app_rdm/utils/constants.dart';

// ignore: must_be_immutable
class ElevatedButtonWidget extends StatelessWidget {
  String title;
  Function onFunction;
  ElevatedButtonWidget({
    super.key,
    required this.title,
    required this.onFunction,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: Container(
        height: 54.0,
        width: double.infinity,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: [
          BoxShadow(
            color: priColor.withOpacity(0.5),
            blurRadius: 7.0,
            offset: const Offset(5, 7),
          ),
        ]),
        child: ElevatedButton(
          onPressed: () {
            onFunction();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: priColor.withOpacity(0.76),
          ),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
