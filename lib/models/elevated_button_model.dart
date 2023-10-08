// ignore_for_file: must_be_immutable, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class ElevatedButtonModel extends StatelessWidget {
  ElevatedButtonModel(this.onPressed, this.buttonIcon, this.buttonText,
      {super.key});

  Function()? onPressed;
  String? buttonText;
  Icon buttonIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(0, 226, 118, 1),
            shadowColor: Colors.transparent),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buttonIcon,
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
