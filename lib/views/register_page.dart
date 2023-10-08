// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:sua_dieta/models/elevated_button_model.dart';
import 'package:sua_dieta/models/return_button_model.dart';
import 'package:sua_dieta/models/text_field_model.dart';
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
          Container(
            padding: const EdgeInsets.only(left: 26, right: 26),
            height: 465,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
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
                  height: 405,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextFieldModel("Digite seu nome", null,
                          Icon(Icons.abc_rounded), false),
                      TextFieldModel("Digite seu e-mail", null,
                          Icon(Icons.email_rounded), false),
                      TextFieldModel("Digite sua senha", null,
                          Icon(Icons.lock_outline_rounded), true),
                      TextFieldModel("Confirme sua senha", null,
                          Icon(Icons.lock_outline_rounded), true),
                      ElevatedButtonModel(
                        () => Navigator.of(context).pushNamed("/user_image"),
                        Icon(Icons.next_plan_rounded),
                        "Continuar",
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
