import 'package:flutter/material.dart';

class customTextField extends StatelessWidget {
  final IconData? icon;
  final bool hideText;
  final bool isPassword;
  final String? hint;
  const customTextField(
      {super.key,
      required this.userFieldController,
      this.icon,
      this.hideText = false,
      this.isPassword = false,
      this.hint});

  final TextEditingController userFieldController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorRadius: const Radius.elliptical(5, 0),
      controller: userFieldController,
      decoration: InputDecoration(
          hintText: hint,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          prefixIcon: Icon(icon),
          suffixIcon: isPassword
              ? const Icon(Icons.visibility)
              : Container(
                  height: 10,
                  width: 10,
                )),
      obscureText: hideText,
    );
  }
}
