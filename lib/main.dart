import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sua_dieta/firebase/config_files.dart';
import 'package:sua_dieta/views/all.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseAndroid);
  runApp(const SuaDieta());
}

class SuaDieta extends StatelessWidget {
  const SuaDieta({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/login": (context) => const LoginPage(),
        "/register": (context) => const RegisterPage(),
        "/more_about_you": (context) => const MoreAboutYouPage(),
        "/user_image": (context) => const UserImagePage(),
        "/home": (context) => const HomePage(),
        "/profile": (context) => const ProfilePage(),
        "/edit_account": (context) => const EditAccountPage(),
        "/new_diet": (context) => const NewDietPage(),
        "/diet": (context) => const DietPage(),
        "/auth": (context) => const AuthPage(),
      },
      initialRoute: "/auth",
      debugShowCheckedModeBanner: false,
    );
  }
}
