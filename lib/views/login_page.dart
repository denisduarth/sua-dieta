// ignore_for_file: sized_box_for_whitespace, avoid_print
import 'package:flutter/material.dart';
import 'package:sua_dieta/models/elevated_button_model.dart';
import 'package:sua_dieta/models/text_field_model.dart';
import 'package:sua_dieta/styles/components/label.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(200, 225, 190, 1),
      body: Container(
        height: 415,
        padding: const EdgeInsets.only(left: 26, right: 26),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 74,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'images/apple_icon.png',
                    width: 35,
                    height: 35,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Sua",
                          style: labelTextStyle['black'],
                        ),
                        TextSpan(
                          text: "Dieta",
                          style: labelTextStyle['white'],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            TextFieldModel(
              "Digite seu login",
              null,
              const Icon(Icons.login_rounded),
            ),
            TextFieldModel(
              "Digite sua senha",
              null,
              const Icon(Icons.password_rounded),
            ),
            ElevatedButtonModel(() => null, const Icon(Icons.login_rounded),
                const Text("Entrar")),
            ElevatedButtonModel(
              () => Navigator.of(context).pushNamed("/register"),
              const Icon(Icons.navigate_next_rounded),
              const Text("Avançar"),
            ),
          ],
        ),
      ),
    );
  }
}