import 'package:flutter/material.dart';
import 'package:flutter_app_rdm/utils/utils.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorListWidget extends StatelessWidget {
  final String title;
  final bool? status;
  final Function onDelete;
  final Function onEdit;

  const DoctorListWidget({
    super.key,
    required this.title,
    this.status,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 7,
        horizontal: 12.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(defaultBorderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black87.withOpacity(0.06),
            blurRadius: 15.0,
            offset: const Offset(3, 5),
          ),
        ],
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: priColor,
          child: Text(
            title[0].toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.normal,
              fontSize: 20.0,
            ),
          ),
        ),
        title: Text(title),
        subtitle: status != null
            ? Text(status! ? "Estado: Activo" : "Estado: Desactivo")
            : Container(),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                onDelete();
              },
              icon: SvgPicture.asset(
                "assets/icons/trash.svg",
                height: 20.0,
              ),
            ),
            IconButton(
              onPressed: () {
                onEdit();
              },
              icon: SvgPicture.asset(
                "assets/icons/edit.svg",
                height: 20.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
