// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sua_dieta/models/widgets/all.dart';
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
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  margin: const EdgeInsets.symmetric(vertical: 15),
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
                        Icon(Icons.verified_rounded),
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
