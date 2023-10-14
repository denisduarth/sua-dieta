// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:sua_dieta/models/widgets/all.dart';
import 'package:sua_dieta/styles/components/label.dart';

class EditAccountPage extends StatefulWidget {
  const EditAccountPage({super.key});

  @override
  State<EditAccountPage> createState() => _EditAccountPageState();
}

class _EditAccountPageState extends State<EditAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(200, 225, 190, 1),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView(
              children: [
                TopBackgroundImageModel(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 30),
                        width: 192,
                        height: 37,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Text(
                                    "Edite sua",
                                    style: labelTextStyle["black"],
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Conta",
                                    style: labelTextStyle["white"],
                                  ),
                                ],
                              ),
                            ),
                            Image.asset(
                              "images/rodrigo_goes.jpg",
                              width: 80,
                              height: 80,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 450,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextFieldModel(
                                "Usuário",
                                null,
                                Icon(Icons.abc_rounded),
                                false,
                                TextInputType.text),
                            TextFieldModel(
                                "usuario@gmail.com",
                                null,
                                Icon(Icons.email_outlined),
                                false,
                                TextInputType.emailAddress),
                            TextFieldModel(
                                "********",
                                null,
                                Icon(Icons.lock_outline_rounded),
                                true,
                                TextInputType.text),
                            TextFieldModel(
                                "********",
                                null,
                                Icon(Icons.lock_outline_rounded),
                                true,
                                TextInputType.text),
                            ElevatedButtonModel(
                              () => Navigator.of(context)
                                  .pushNamed("/more_about_you"),
                              buttonIcon: Icon(Icons.save),
                              buttonText: "Salvar",
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
