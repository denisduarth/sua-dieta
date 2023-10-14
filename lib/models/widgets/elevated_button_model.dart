// ignore_for_file: must_be_immutable, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:sua_dieta/styles/components/colors.dart';

class ElevatedButtonModel extends StatelessWidget {
  ElevatedButtonModel(this.onPressed,
      {this.buttonIcon,
      this.buttonText,
      this.backgroundColor = buttonColor,
      super.key});

  Function()? onPressed;
  String? buttonText;
  Icon? buttonIcon;
  Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor, shadowColor: Colors.transparent),
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
