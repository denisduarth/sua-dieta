// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

class TextFieldModel extends StatelessWidget {
  String? hintText;
  TextEditingController? textEditingController;
  Icon? icon;

  TextFieldModel(this.hintText, this.textEditingController, this.icon,
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
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey),
              prefixIcon: icon,
              prefixIconColor: Colors.grey,
              border: InputBorder.none,
            ),
            controller: textEditingController,
          ),
        ],
      ),
    );
  }
}
