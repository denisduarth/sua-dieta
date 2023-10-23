// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sua_dieta/views/all.dart';

const firebaseConfig = FirebaseOptions(
  apiKey: "AIzaSyAVd2cgZNc6BHv9d3jfzcFT9w9ugbCCCzo",
  authDomain: "sua-dieta-ba80d.firebaseapp.com",
  projectId: "sua-dieta-ba80d",
  storageBucket: "sua-dieta-ba80d.appspot.com",
  messagingSenderId: "539077520468",
  appId: "1:539077520468:web:8d6af7f7d076711a64d1c1"
);

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseConfig);
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
        "/new_diet": (context) => NewDietPage()
      },
      initialRoute: "/login",
    );
  }
}
