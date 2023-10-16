// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:sua_dieta/styles/components/colors.dart';

class RecipeModel extends StatelessWidget {
  final String recipeModelImage, recipeModelText, recipeModelDate;
  final Function()? onTap;

  const RecipeModel(this.recipeModelImage, this.recipeModelText,
      this.recipeModelDate, this.onTap,
      {super.key});

  get animationController => null;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        height: 85,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 0),
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Image.asset(
                recipeModelImage,
                width: 120,
                height: 85,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recipeModelText,
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w700,
                      fontSize: 15),
                ),
                Text(
                  recipeModelDate,
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: hyperTextColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
