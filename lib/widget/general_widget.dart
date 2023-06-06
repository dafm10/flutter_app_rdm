import 'package:flutter/material.dart';
import 'package:flutter_app_rdm/utils/utils.dart';

void messageSuccessSnackBar(BuildContext context, int type) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: priColor.withOpacity(0.6),
      content: Row(
        children: [
          const Icon(
            Icons.check_circle,
            color: Colors.white,
          ),
          const SizedBox(
            width: 10.0,
          ),
          Text(
            textMessage[type],
            style: const TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}
