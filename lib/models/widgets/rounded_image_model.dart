// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class RoundedImageModel extends StatelessWidget {
  RoundedImageModel(this.source, this.height, this.width, {super.key});

  String source;
  double? width, height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 4),
              blurRadius: 1,
            ),
          ],
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
