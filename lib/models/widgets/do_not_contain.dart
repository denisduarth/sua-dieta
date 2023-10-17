// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:sua_dieta/styles/components/colors.dart';

class DoNotContainModel extends StatelessWidget {
  String? item;

  DoNotContainModel(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        "$item",
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontFamily: "Poppins",
            fontSize: 10),
      ),
    );
  }
}
