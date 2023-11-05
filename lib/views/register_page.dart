// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, sort_child_properties_last, avoid_print

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sua_dieta/models/widgets/all.dart';
import 'package:sua_dieta/styles/components/colors.dart';
import 'package:sua_dieta/styles/components/label.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final supabase = Supabase.instance.client;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  Future<void> signUp() async {
    try {
      await supabase.auth.signUp(
          password: passwordController.text, email: emailController.text);
    } catch (e) {
      print(e);
    }
  }

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
                        mainAxisAlignment: MainAxisAlignment.center,
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
                      TextFieldModel("Digite seu e-mail", emailController,
                          Icon(Icons.email), false, TextInputType.emailAddress),
                      TextFieldModel("Digite sua senha", passwordController,
                          Icon(Icons.lock), true, TextInputType.text),
                      TextFieldModel(
                          "Confirme sua senha",
                          passwordConfirmController,
                          Icon(Icons.lock),
                          true,
                          TextInputType.text),
                      ElevatedButtonModel(
                        () {
                          return passwordController.text !=
                                  passwordConfirmController.text
                              ? ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Senhas não coincidem!"),
                                    backgroundColor: Colors.red[400],
                                  ),
                                )
                              : signUp().then(
                                  (value) =>
                                      Navigator.pushNamed(context, "/login"),
                                );
                        },
                        Icon(Icons.create),
                        "Criar conta",
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/login'),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 10,
                                color: buttonColor,
                              ),
                            ),
                          ),
                          child: Text(
                            'Já tem uma conta? faça login!',
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      )
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
