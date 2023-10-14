// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sua_dieta/models/widgets/all.dart';
import 'package:sua_dieta/styles/components/colors.dart';
import 'package:sua_dieta/styles/components/label.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
                            "Sua",
                            style: labelTextStyle["black"],
                          ),
                          Text(
                            "conta",
                            style: labelTextStyle["white"],
                          ),
                          Image.asset(
                            "images/user_icon.png",
                            width: 35,
                            height: 35,
                          ),
                        ],
                      ),
                      Container(
                          child: Column(
                        children: [
                              Text(
                                "Usuário",
                                style: labelTextStyle["black"],
                              ),
                              Text("usuario@gmail.com",
                                style: labelTextStyle["black"],
                              ),
                              Text(
                                "1,80",
                                style: labelTextStyle["black"],
                              ),
                              Text(
                                "90 KG",
                                style: labelTextStyle["black"],
                              ),
                              SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                      ),
                      RoundedImageModel("images/rodrigo_goes.jpg", 150, 150),
                      ElevatedButtonModel(
                        () => Navigator.of(context).pushNamed("/login"),
                        buttonIcon: const Icon(Icons.verified_rounded),
                        buttonText: "Editar perfil",
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
