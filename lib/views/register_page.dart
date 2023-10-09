// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:sua_dieta/models/elevated_button_model.dart';
import 'package:sua_dieta/models/text_field_model.dart';
import 'package:sua_dieta/models/top_background_image_model.dart';
import 'package:sua_dieta/styles/components/label.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(200, 225, 190, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                TopBackgroundImageModel(),
                Container(
                  padding: const EdgeInsets.only(left: 26, right: 26),
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
                                ],
                              ),
                            ),
                            Image.asset(
                              "images/user_icon.png",
                              width: 35,
                              height: 35,
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
                                "Digite seu nome",
                                null,
                                Icon(Icons.abc_rounded),
                                false,
                                TextInputType.text),
                            TextFieldModel(
                                "Digite seu e-mail",
                                null,
                                Icon(Icons.email_outlined),
                                false,
                                TextInputType.emailAddress),
                            TextFieldModel(
                                "Digite sua senha",
                                null,
                                Icon(Icons.lock_outline_rounded),
                                true,
                                TextInputType.text),
                            TextFieldModel(
                                "Confirme sua senha",
                                null,
                                Icon(Icons.lock_outline_rounded),
                                true,
                                TextInputType.text),
                            ElevatedButtonModel(
                              () => Navigator.of(context)
                                  .pushNamed("/more_about_you"),
                              Icon(Icons.next_plan_rounded),
                              "Continuar",
                            ),
                            Container(
                              child: InkWell(
                                onTap: Navigator.of(context).pop,
                                child: Text(
                                  "Já tem uma conta? Faça login agora!",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
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
          ),
        ],
      ),
    );
  }
}
