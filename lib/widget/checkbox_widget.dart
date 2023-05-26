import 'package:flutter/material.dart';
import 'package:flutter_app_rdm/models/models.dart';
import 'package:flutter_app_rdm/utils/constants.dart';

// ignore: must_be_immutable
class CheckBoxWidget extends StatefulWidget {
  CheckBoxModel checkBoxModel;
  // bool isChecked;
  // String title;
  CheckBoxWidget({
    super.key,
    required this.checkBoxModel,
    // required this.isChecked,
    // required this.title,
  });

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
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
        Expanded(
          child: Text(
            widget.checkBoxModel.title,
            style: const TextStyle(
              color: Colors.black87,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}
