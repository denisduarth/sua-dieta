// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

class TextFieldModel extends StatelessWidget {
  String? hintText;
  TextEditingController? textEditingController;
  Icon? icon;
  bool obscureTextController;
  TextInputType keyboardType;

  TextFieldModel(this.hintText, this.textEditingController, this.icon,
      this.obscureTextController, this.keyboardType,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        children: [
          TextField(
            keyboardType: keyboardType,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                  color: Colors.grey[300],
                  fontFamily: "Poppins",
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
              prefixIcon: icon,
              prefixIconColor: Colors.grey[300],
              border: InputBorder.none,
            ),
            controller: textEditingController,
            obscureText: obscureTextController,
          ),
        ],
      ),
    );
  }
}
