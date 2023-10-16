// ignore_for_file: must_be_immutable, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class TopBackgroundImageModel extends StatelessWidget {
  TopBackgroundImageModel({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(200),
        bottomRight: Radius.circular(200),
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200),
        ),
        child: Image.asset(
          "images/top_background_image.png",
          height: 200,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
