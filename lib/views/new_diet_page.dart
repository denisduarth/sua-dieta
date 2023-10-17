// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sua_dieta/models/widgets/all.dart';
import 'package:sua_dieta/styles/components/colors.dart';
import 'package:sua_dieta/styles/components/label.dart';

List<String?> filtros = [
  "Sem glúten",
  "Sem sódio",
  "Sem açúcar",
  "Sem lactose",
  "Vegana",
  "Vegetariana"
];

class NewDietPage extends StatefulWidget {
  const NewDietPage({super.key});

  @override
  State<NewDietPage> createState() => _NewDietPageState();
}

class _NewDietPageState extends State<NewDietPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                TopBackgroundImageModel(),
                Container(
                  height: 500,
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Nova ",
                                  style: labelTextStyle['black'],
                                ),
                                TextSpan(
                                  text: "Dieta ",
                                  style: labelTextStyle['white'],
                                ),
                              ],
                            ),
                          ),
                          Image.asset(
                            'images/vegetables_icon.png',
                            width: 50,
                            height: 50,
                          ),
                        ],
                      ),
                      TextFieldModel("Nome da dieta", null,
                          const Icon(Icons.abc), false, TextInputType.text),
                      TextFieldModel(
                        "Objetivo",
                        null,
                        const Icon(Icons.notes_rounded),
                        false,
                        TextInputType.text,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Text(
                              "Filtros",
                              style: labelTextStyle["dark_green"],
                            ),
                            // GridView(
                            //   gridDelegate:
                            //       SliverGridDelegateWithFixedCrossAxisCount(
                            //           crossAxisCount: 2),
                            //   children: [
                            //     for (var item in filtros) ...{
                            //       RadioListTile(
                            //           value: item,
                            //           groupValue: filtros,
                            //           onChanged: (var value) {
                            //             setState(() {
                            //               item = value as String?;
                            //             });
                            //           })
                            //     }
                            //   ],
                            // )
                            Text("TODO")
                          ],
                        ),
                      ),
                      TextFieldModel(
                        "Não contém",
                        null,
                        Icon(Icons.no_food_rounded),
                        false,
                        TextInputType.text,
                      ),
                      ElevatedButtonModel(
                        () => Navigator.of(context).pushNamed("/profile"),
                        buttonIcon: Icon(Icons.verified_rounded),
                        buttonText: "Gerar Dieta",
                      )
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
