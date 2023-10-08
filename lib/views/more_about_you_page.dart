// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:sua_dieta/models/elevated_button_model.dart';
import 'package:sua_dieta/models/text_field_model.dart';
import 'package:sua_dieta/styles/components/colors.dart';
import 'package:sua_dieta/styles/components/label.dart';

class MoreAboutYouPage extends StatefulWidget {
  const MoreAboutYouPage({super.key});

  @override
  State<MoreAboutYouPage> createState() => _MoreAboutYouPageState();
}

class _MoreAboutYouPageState extends State<MoreAboutYouPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 500,
            padding: EdgeInsets.only(right: 26, left: 26),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Text(
                              "Mais sobre",
                              style: labelTextStyle["black"],
                            ),
                            Text(
                              " você",
                              style: labelTextStyle["white"],
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        "images/user_icon.png",
                        height: 35,
                        width: 35,
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 87),
                  height: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextFieldModel(
                        "Sua Altura",
                        null,
                        Icon(Icons.height_rounded),
                        false,
                        TextInputType.number,
                      ),
                      TextFieldModel(
                        "Seu Peso",
                        null,
                        Icon(Icons.monitor_weight_rounded),
                        false,
                        TextInputType.number,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 90,
                  margin: EdgeInsets.only(top: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Alergias",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w700,
                            fontSize: 14),
                      ),
                      TextFieldModel(
                        "Digite aqui suas alergias",
                        null,
                        Icon(Icons.no_food_rounded),
                        false,
                        TextInputType.text,
                      ),
                    ],
                  ),
                ),
                ElevatedButtonModel(
                  () => Navigator.of(context).pushNamed("/user_image"),
                  Icon(Icons.next_plan_rounded),
                  "Continuar",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
