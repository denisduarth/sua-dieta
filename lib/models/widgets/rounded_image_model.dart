// ignore_for_file: must_be_immutable, prefer_const_constructors
import 'package:flutter/material.dart';

class RoundedImageModel extends StatelessWidget {
  RoundedImageModel(this.source, this.height, this.width, {super.key});

  String source;
  double? width, height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(200),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200),
        ),
        child: Image.asset(
          source,
          height: height,
          width: width,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
