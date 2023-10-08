// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sua_dieta/views/more_about_you_page.dart';
import 'package:sua_dieta/views/register_page.dart';
import 'package:sua_dieta/views/user_image_page.dart';
import 'views/login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const SuaDieta());
}

class SuaDieta extends StatelessWidget {
  const SuaDieta({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/login": (context) => LoginPage(),
        "/register": (context) => RegisterPage(),
        "/more_about_you": (context) => MoreAboutYouPage(),
        "/user_image": (context) => UserImagePage()
      },
      initialRoute: "/login",
    );
  }
}
