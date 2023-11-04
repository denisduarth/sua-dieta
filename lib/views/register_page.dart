// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, sort_child_properties_last

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sua_dieta/models/widgets/all.dart';
import 'package:sua_dieta/styles/components/colors.dart';
import 'package:sua_dieta/styles/components/label.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: RefreshIndicator(
        color: backgroundColor,
        backgroundColor: Colors.black,
        onRefresh: () => Future.delayed(Duration(seconds: 3)),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TopBackgroundImageModel(),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Criar",
                            style: labelTextStyle["black"],
                          ),
                          Text(
                            " Conta",
                            style: labelTextStyle["white"],
                          ),
                        ],
                      ),
                      TextFieldModel(
                          "Digite seu e-mail",
                          emailController,
                          Icon(Icons.email_outlined),
                          false,
                          TextInputType.emailAddress),
                      TextFieldModel(
                          "Digite sua senha",
                          passwordController,
                          Icon(Icons.lock_outline_rounded),
                          true,
                          TextInputType.text),
                      TextFieldModel(
                          "Confirme sua senha",
                          passwordConfirmController,
                          Icon(Icons.lock_outline_rounded),
                          true,
                          TextInputType.text),
                      ElevatedButtonModel(
                        () {
                          if (passwordController.text !=
                              passwordConfirmController.text) {
                            return ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Senhas não coincidem!"),
                                backgroundColor: Colors.red[400],
                              ),
                            );
                          } else {
                            FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passwordController.text)
                                .then((value) =>
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content:
                                            Text("Usuário criado com sucesso!"),
                                        backgroundColor: Colors.green[400],
                                      ),
                                    ))
                                .then((value) =>
                                    Navigator.pushNamed(context, "/login"));
                          }
                        },
                        Icon(Icons.create),
                        "Criar conta",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
