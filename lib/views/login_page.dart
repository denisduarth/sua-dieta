// ignore_for_file: sized_box_for_whitespace, avoid_print, prefer_const_constructors, unused_import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sua_dieta/models/widgets/all.dart';
import 'package:sua_dieta/styles/components/colors.dart';
import 'package:sua_dieta/styles/components/label.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          print('Usuário não encontrado');
        case 'wrong-password':
          print('Senha Incorreta');
        default:
          return;
      }
    }
  }

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
                  height: 500,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          "Digite seu e-mail",
                          emailController,
                          const Icon(Icons.login_rounded),
                          false,
                          TextInputType.text),
                      TextFieldModel(
                          "Digite sua senha",
                          passwordController,
                          const Icon(Icons.lock_outline_rounded),
                          true,
                          TextInputType.text),
                      ElevatedButtonModel(
                        () => signIn(),
                        buttonIcon: const Icon(
                          Icons.login_rounded,
                        ),
                        buttonText: "Entrar",
                      ),
                      const Text(
                        "ou",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 20),
                      ),
                      ElevatedButtonModel(
                        () => Navigator.of(context).pushNamed("/register"),
                        buttonIcon: const Icon(Icons.person_add),
                        buttonText: "Criar conta",
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
