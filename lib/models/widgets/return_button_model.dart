import 'package:flutter/material.dart';
import 'package:sua_dieta/styles/components/colors.dart' as colors;

class ReturnButtonModel extends StatelessWidget {
  const ReturnButtonModel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: colors.buttonColor,
      ),
      child: ElevatedButton(
        onPressed: Navigator.of(context).pop,
        child: const Icon(Icons.navigate_before_rounded),
      ),
    );
  }
}
