// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:sua_dieta/models/widgets/all.dart';
import 'package:sua_dieta/styles/components/colors.dart';
import 'package:sua_dieta/styles/components/label.dart';

String? dietaSelecionada = "Vegetariana";
List<String> filtros = [
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TopBackgroundImageModel(),
            Container(
              height: 400,
              margin: const EdgeInsets.symmetric(vertical: 15),
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    ],
                  ),
                  TextFieldModel("Nome da dieta", null, const Icon(Icons.abc),
                      false, TextInputType.text),
                  TextFieldModel(
                    "Objetivo",
                    null,
                    const Icon(Icons.notes_rounded),
                    false,
                    TextInputType.text,
                  ),
                  Row(
                    children: [
                      Text(
                        "Tipo da",
                        style: labelTextStyle["black"],
                      ),
                      Text(
                        " receita",
                        style: labelTextStyle["white"],
                      ),
                    ],
                  ),
                  Container(
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        DropdownButton(
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          dropdownColor: Colors.white,
                          focusColor: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          value: dietaSelecionada,
                          onChanged: (String? newValue) {
                            setState(
                              () {
                                dietaSelecionada = newValue!;
                              },
                            );
                          },
                          items: filtros.map((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
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
    );
  }
}
