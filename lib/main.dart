// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sua_dieta/views/register_page.dart';
import 'views/login_page.dart';

void main() {
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
      },
      initialRoute: "/login",
    );
  }
}
