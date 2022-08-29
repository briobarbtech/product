import 'package:flutter/material.dart';

class ButtonAction extends StatelessWidget {
  final void function;
  final String title;
  const ButtonAction({
    Key? key,
    this.function,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          function;
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.grey[300])),
        child: Text(
          title,
          style: const TextStyle(color: Colors.black),
        ));
  }
}
