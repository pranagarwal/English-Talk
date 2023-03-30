import 'package:flutter/material.dart';

class TextFieldd extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextInputType keyboard;
  final TextEditingController controller;

  const TextFieldd({
    required this.hintText,
    required this.obscureText,
    required this.keyboard,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller,
        keyboardType: keyboard,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              fontSize: 20,
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
              ),
            )),
        obscureText: obscureText,
      ),
    );
  }
}
