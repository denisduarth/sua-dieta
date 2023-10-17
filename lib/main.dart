// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sua_dieta/views/all.dart';
import 'package:sua_dieta/views/diet_page.dart';

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
        "/user_image": (context) => UserImagePage(),
        "/home": (context) => HomePage(),
        "/profile": (context) => ProfilePage(),
        "/edit_account": (context) => EditAccountPage(),
        "/new_diet": (context) => NewDietPage(),
        "/diet": (context) => DietPage()
      },
      initialRoute: "/login",
    );
  }
}
