// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sua_dieta/styles/components/colors.dart';

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
        borderRadius: BorderRadius.all(Radius.circular(7)),
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
            cursorWidth: 3.0,
            cursorColor: backgroundColor,
            cursorRadius: Radius.circular(7),
            keyboardType: keyboardType,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              hintText: hintText,
              hintStyle: TextStyle(
                  color: Colors.grey[300],
                  fontFamily: "Poppins",
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
              suffixIcon: icon,
              suffixIconColor: Colors.grey[300],
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
