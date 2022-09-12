import 'package:flutter/material.dart';

class TextFieldForm extends StatelessWidget {
  const TextFieldForm({Key? key, required this.controller, required this.label})
      : super(key: key);

  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Por favor, revisar el campo';
        } else {
          return null;
        }
      },
    );
  }
}
