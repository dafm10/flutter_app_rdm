import 'package:flutter/material.dart';
import 'package:flutter_app_rdm/utils/constants.dart';

class CheckBoxWidget extends StatefulWidget {
  bool isChecked;
  String title;
  CheckBoxWidget({
    super.key,
    required this.isChecked,
    required this.title,
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
          value: widget.isChecked,
          onChanged: (bool? value) {
            setState(() {
              widget.isChecked = value!;
            });
          },
        ),
        Text(widget.title),
      ],
    );
  }
}
