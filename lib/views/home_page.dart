// ignore_for_file: prefer_const_constructors

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
                TopBackgroundImageModel(),
                TextFieldModel(
                    "Pesquisar",
                    null,
                    const Icon(Icons.search_rounded),
                    false,
                    TextInputType.text),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Criar",
                            style: labelTextStyle["black"],
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Conta",
                            style: labelTextStyle["white"],
                          ),
                          Image.asset(
                            "images/rodrigo_goes.jpg",
                            width: 35,
                            height: 35,
                          )
                        ],
                      )
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
