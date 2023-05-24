import 'package:flutter/material.dart';
import 'package:flutter_app_rdm/models/checkbox_model.dart';

import '../utils/constants.dart';

// ignore: must_be_immutable
class CreateCheckBoxWidget extends StatefulWidget {
  final CheckBoxModel checkBoxModel;
  String title;

  CreateCheckBoxWidget({
    required this.checkBoxModel,
    required this.title,
    super.key,
  });

  @override
  State<CreateCheckBoxWidget> createState() => _CreateCheckBoxWidgetState();
}

class _CreateCheckBoxWidgetState extends State<CreateCheckBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          activeColor: priColor.withOpacity(0.8),
          value: widget.checkBoxModel.selected,
          onChanged: (bool? value) {
            setState(() {
              widget.checkBoxModel.selected = value!;
            });
          },
        ),
        Text(
          widget.title,
          style: const TextStyle(
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
