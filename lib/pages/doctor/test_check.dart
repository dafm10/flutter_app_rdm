import 'package:flutter/material.dart';
import 'package:flutter_app_rdm/models/checkbox_model.dart';

class TestCheck extends StatefulWidget {
  const TestCheck({super.key});

  @override
  State<TestCheck> createState() => _TestCheckState();
}

class _TestCheckState extends State<TestCheck> {
  final List<CheckBoxModel> _checkContact = [];
  bool isCheckedPhone = false;
  bool isCheckedWhatsApp = false;

  @override
  void initState() {
    _checkContact.addAll({
      CheckBoxModel(id: 1, title: "WhatsApp", selected: false),
      CheckBoxModel(id: 2, title: "Teléfono", selected: false),
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _checkContact.length,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: Text(_checkContact[index].title),
            value: _checkContact[index].selected,
            onChanged: null,
          );
        },
      ),
    );
  }
}
