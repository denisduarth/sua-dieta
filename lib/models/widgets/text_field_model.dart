// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

final labelStyle = TextStyle(
  color: Colors.grey[300],
  fontFamily: "Poppins",
  fontSize: 13,
  fontWeight: FontWeight.w600,
);

class TextFieldModel extends StatelessWidget {
  String? labelText;
  TextEditingController? textEditingController;
  Icon? icon;
  bool obscureTextController;
  TextInputType keyboardType;

  TextFieldModel(this.labelText, this.textEditingController, this.icon,
      this.obscureTextController, this.keyboardType,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(6)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 0),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: [
          TextField(
            cursorRadius: Radius.circular(6),
            keyboardType: keyboardType,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              // contentPadding: EdgeInsets.symmetric(horizontal: 20),
              labelText: labelText,
              labelStyle: labelStyle,
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
