// ignore_for_file: must_be_immutable, sized_box_for_whitespace, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sua_dieta/styles/components/colors.dart';

class ElevatedButtonModel extends StatelessWidget {
  Function()? onPressed;
  String? buttonText;
  Icon? buttonIcon;

  ElevatedButtonModel(this.onPressed, this.buttonIcon, this.buttonText,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shadowColor: Colors.transparent,
          padding: EdgeInsets.symmetric(
            vertical: 10,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buttonIcon!,
            const SizedBox(
              width: 5,
            ),
            Text(
              "$buttonText",
              style: const TextStyle(
                fontFamily: "Poppins",
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
