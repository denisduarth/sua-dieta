// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sua_dieta/styles/components/colors.dart' as components;

class ElevatedButtonModel extends StatelessWidget {
  ElevatedButtonModel(this.onPressed, this.buttonIcon, this.buttonText,
      {super.key});

  Function()? onPressed;
  Text buttonText;
  Icon buttonIcon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 10,
        backgroundColor: components.backgroundColor,
      ),
      child: Row(
        children: [
          buttonIcon,
          buttonText,
        ],
      ),
    );
  }
}
