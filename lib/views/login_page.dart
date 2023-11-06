// ignore_for_file: sized_box_for_whitespace, avoid_print, prefer_const_constructors, unused_import, use_build_context_synchronously
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sua_dieta/models/widgets/all.dart';
import 'package:sua_dieta/styles/components/colors.dart';
import 'package:sua_dieta/styles/components/label.dart';
import 'package:sua_dieta/views/all.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  final supabase = Supabase.instance.client;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  // late final StreamSubscription<AuthState> _authSubscription;

  void signIn() async {
    try {
      await supabase.auth.signInWithPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on AuthException catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message),
          backgroundColor: Colors.red[400],
        ),
      );
    }
  }

  // @override
  // void initState() {
  //   super.initState();
  //   _authSubscription = supabase.auth.onAuthStateChange.listen(
  //     (event) {
  //       final session = event.session;
  //       if (session != null) {
  //         Navigator.pushNamed(context, '/home');
  //       }
  //     },
  //   );
  // }

  // @override
  // void dispose() {
  //   emailController.dispose();
  //   passwordController.dispose();
  //   _authSubscription.cancel();
  //   super.dispose();
  // }

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
                TextFieldModel('Senha', passwordController, Icon(Icons.lock),
                    true, TextInputType.visiblePassword),
                ElevatedButtonModel(
                  () {
                    signIn();
                    final user = supabase.auth.currentUser;

                    if (user != null) {
                      try {
                        return user.userMetadata?['name'] == null ||
                                user.userMetadata?['weight'] == null ||
                                user.userMetadata?['height'] == null
                            ? Navigator.pushNamed(context, '/more_about_you')
                            : Navigator.pushNamed(context, '/home');
                      } on AuthException catch (error) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(error.message),
                            backgroundColor: Colors.red[400],
                          ),
                        );
                      }
                    }
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
                          width: 10,
                          color: buttonColor,
                        ),
                      ),
                    ),
                    child: Text(
                      'Não tem uma conta? Crie agora!',
                      style: TextStyle(
                          fontSize: 13,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600),
                    ),
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
