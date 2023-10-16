// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sua_dieta/models/widgets/all.dart';
import 'package:sua_dieta/styles/components/colors.dart';
import 'package:sua_dieta/styles/components/label.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                Stack(
                  children: [
                    TopBackgroundImageModel(),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      margin: EdgeInsets.symmetric(vertical: 30),
                      child: TextFieldModel(
                        "Pesquisar dieta",
                        null,
                        const Icon(Icons.search_rounded),
                        false,
                        TextInputType.text,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Bem-vindo",
                                style: labelTextStyle["black"],
                              ),
                              Text(
                                "Usuário",
                                style: labelTextStyle["white"],
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () =>
                                Navigator.of(context).pushNamed("/profile"),
                            child: RoundedImageModel(
                              "images/rodrigo_goes.jpg",
                              80,
                              80,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Mais Recentes",
                                  style: TextStyle(
                                      color: hyperTextColor,
                                      fontSize: 17,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Image.asset(
                                  "images/vegetables_icon.png",
                                  width: 30,
                                  height: 30,
                                )
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  DietModel("images/vegetarian_diet_image.jpg",
                                      "Vegetariana", "10/10/2023", () {}),
                                  DietModel("images/low_carb_diet.jpg",
                                      "Low Carb", "11/10/2023", () {}),
                                  DietModel("images/low_carb_diet.jpg",
                                      "Low Carb 2", "11/10/2023", () {}),
                                  DietModel("images/low_carb_diet.jpg",
                                      "Low Carb 3", "11/10/2023", () {}),
                                  DietModel("images/low_carb_diet.jpg",
                                      "Low Carb 4", "11/10/2023", () {}),
                                  DietModel("images/low_carb_diet.jpg",
                                      "Low Carb 5", "11/10/2023", () {}),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
