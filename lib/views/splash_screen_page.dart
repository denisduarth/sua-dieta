// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:sua_dieta/styles/components/label.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          height: 500,
          width: 900,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "images/apple_icon.png",
                height: 65,
                width: 65,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Sua",
                      style: labelTextStyle['black'],
                    ),
                    TextSpan(
                      text: "Dieta",
                      style: labelTextStyle['white'],
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
