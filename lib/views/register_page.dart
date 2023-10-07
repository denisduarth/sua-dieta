// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:sua_dieta/models/elevated_button_model.dart';
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
      appBar: AppBar(
        title: Text("Tela de cadastro"),
      ),
      body: Container(
        height: 465,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 192,
              height: 37,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Criar",
                          style: labelTextStyle['black'],
                        ),
                        TextSpan(
                          text: "Conta",
                          style: labelTextStyle['white'],
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
                  TextFieldModel(
                    "Digite seu nome",
                    null,
                    Icon(Icons.abc_rounded),
                  ),
                  TextFieldModel(
                    "Digite seu e-mail",
                    null,
                    Icon(Icons.email_rounded),
                  ),
                  TextFieldModel(
                    "Digite sua senha",
                    null,
                    Icon(Icons.password_rounded),
                  ),
                  TextFieldModel(
                    "Confirme sua senha",
                    null,
                    Icon(Icons.password_rounded),
                  ),
                  ElevatedButtonModel(
                    () => null,
                    Icon(Icons.verified_rounded),
                    Text("Criar conta"),
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
