// ignore_for_file: must_be_immutable, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class TopBackgroundImageModel extends StatelessWidget {
  TopBackgroundImageModel({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(150),
        bottomRight: Radius.circular(150),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(150),
        ),
        child: Image.asset(
          "images/top_background_image.png",
          height: 150,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
