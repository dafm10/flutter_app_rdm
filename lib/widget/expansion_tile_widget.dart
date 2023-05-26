import 'package:flutter/material.dart';
import 'package:flutter_app_rdm/utils/constants.dart';
import 'package:flutter_app_rdm/widget/widgets.dart';

// ignore: must_be_immutable
class ExpansionTileWidget extends StatefulWidget {
  String title;
  Widget childrens;
  ExpansionTileWidget({
    super.key,
    required this.title,
    required this.childrens,
  });

  @override
  State<ExpansionTileWidget> createState() => _ExpansionTileWidgetState();
}

class _ExpansionTileWidgetState extends State<ExpansionTileWidget> {
  bool _customTileExpanded = false;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      childrenPadding: EdgeInsets.zero,
      title: Text2RegisterFormWidget(
        title: widget.title,
      ),
      subtitle: const Text("Elige una o varias opciones"),
      trailing: Icon(
        _customTileExpanded
            ? Icons.arrow_drop_down_circle_outlined
            : Icons.arrow_drop_down,
        color: grayColor,
      ),
      children: [
        widget.childrens,
      ],
      onExpansionChanged: (bool expanded) {
        setState(
          () {
            _customTileExpanded = expanded;
          },
        );
      },
    );
  }
}
