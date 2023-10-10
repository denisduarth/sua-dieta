// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sua_dieta/models/elevated_button_model.dart';
import 'package:sua_dieta/models/rounded_image_model.dart';
import 'package:sua_dieta/models/top_background_image_model.dart';
import 'package:sua_dieta/styles/components/colors.dart';
import 'package:sua_dieta/styles/components/label.dart';

class UserImagePage extends StatefulWidget {
  const UserImagePage({super.key});

  @override
  State<UserImagePage> createState() => _UserImagePageState();
}

class _UserImagePageState extends State<UserImagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView(
              children: [
                TopBackgroundImageModel(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 26),
                  margin: EdgeInsets.symmetric(vertical: 20),
                  height: 500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Selecione uma ",
                            style: labelTextStyle["black"],
                          ),
                          Text(
                            "Foto",
                            style: labelTextStyle["white"],
                          ),
                          Image.asset(
                            "images/user_icon.png",
                            width: 35,
                            height: 35,
                          ),
                        ],
                      ),
                      RoundedImageModel("images/rodrigo_goes.jpg", 200, 200),
                      ElevatedButtonModel(
                        () => Navigator.of(context).pushNamed("/login"),
                        const Icon(Icons.verified_rounded),
                        "Finalizar",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
