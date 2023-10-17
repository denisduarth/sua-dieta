// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:sua_dieta/models/widgets/all.dart';
import 'package:sua_dieta/models/widgets/do_not_contain.dart';
import 'package:sua_dieta/styles/components/colors.dart';
import 'package:sua_dieta/styles/components/label.dart';

class DietPage extends StatefulWidget {
  const DietPage({super.key});

  @override
  State<DietPage> createState() => _DietPageState();
}

const List<String?> naoContem = ["Amendoim", "Lagosta", "Camarão"];
const Map<String, List<String>> refeicoes = {
  "Café da manha": ["Aveia", "Nozes", "Banana", "Amêndoas"],
  "Almoço": ["Frango", "Brócolis", "Cenoura", "Quinoa", "Arroz"],
  "Jantar": ["Salmão", "Brócolis", "Batata Doce"]
};

class _DietPageState extends State<DietPage> {
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
                  height: 1050,
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Low ",
                            style: labelTextStyle["black"],
                          ),
                          Text(
                            "Carb",
                            style: labelTextStyle["white"],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Não contém: ",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: "Poppins"),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              for (var item in naoContem) ...{
                                DoNotContainModel(item)
                              },
                            ],
                          )
                        ],
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  Text(
                                    "Café da manhã",
                                    style: labelTextStyle["dark_green"],
                                  ),
                                  Column(
                                    children: [
                                      ListTile(
                                        title: Text("Aveia"),
                                      ),
                                      ListTile(
                                        title: Text("Banana"),
                                      ),
                                      ListTile(
                                        title: Text("Nozes"),
                                      ),
                                      ListTile(
                                        title: Text("Amêndoas"),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Text(
                                    "Almoço",
                                    style: labelTextStyle["dark_green"],
                                  ),
                                  Column(
                                    children: [
                                      ListTile(
                                        title: Text("Frango"),
                                      ),
                                      ListTile(
                                        title: Text("Brócolis"),
                                      ),
                                      ListTile(
                                        title: Text("Cenouras"),
                                      ),
                                      ListTile(
                                        title: Text("Quinoa"),
                                      ),
                                      ListTile(
                                        title: Text("Amêndoas"),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Text(
                                    "Jantar",
                                    style: labelTextStyle["dark_green"],
                                  ),
                                  Column(
                                    children: [
                                      ListTile(
                                        title: Text("Salmão"),
                                      ),
                                      ListTile(
                                        title: Text("Brócolis"),
                                      ),
                                      ListTile(
                                        title: Text("Batata-doce"),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            ElevatedButtonModel(
                              () => Navigator.of(context).pushNamed("/profile"),
                              buttonIcon: Icon(Icons.verified_rounded),
                              buttonText: "Finalizar",
                            ),
                          ],
                        ),
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
