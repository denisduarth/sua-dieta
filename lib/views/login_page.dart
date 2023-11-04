// ignore_for_file: sized_box_for_whitespace, avoid_print, prefer_const_constructors, unused_import, use_build_context_synchronously
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sua_dieta/models/widgets/all.dart';
import 'package:sua_dieta/styles/components/colors.dart';
import 'package:sua_dieta/styles/components/label.dart';
import 'package:sua_dieta/views/all.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: RefreshIndicator(
        color: backgroundColor,
        backgroundColor: Colors.black,
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 3));
          emailController.clear();
          passwordController.clear();
        },
        child: SingleChildScrollView(
          child: Container(
            height: 550,
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TopBackgroundImageModel(),
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
                TextFieldModel(
                  'E-mail',
                  emailController,
                  Icon(Icons.email_rounded),
                  false,
                  TextInputType.emailAddress,
                ),
                TextFieldModel(
                    'Senha',
                    passwordController,
                    Icon(Icons.password_rounded),
                    true,
                    TextInputType.visiblePassword),
                ElevatedButtonModel(
                  () {
                    FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text);

                    final user = FirebaseAuth.instance.currentUser;

                    return (user!.displayName == null || user.photoURL == null)
                        ? Navigator.pushNamed(context, '/more_about_you')
                        : Navigator.pushNamed(context, '/home');
                  },
                  Icon(Icons.login_sharp),
                  'Login',
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/register'),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 9,
                          color: buttonColor,
                        ),
                      ),
                    ),
                    child: Text(
                      'Não tem uma conta? Crie agora!',
                      style: TextStyle(
                          fontSize: 12.5,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
