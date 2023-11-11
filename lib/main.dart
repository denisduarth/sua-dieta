import 'package:flutter/material.dart';
import 'package:sua_dieta/views/all.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRjZWxkaHJ0YWpveXZ1aWprbXBlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTkxOTQ0MDIsImV4cCI6MjAxNDc3MDQwMn0.Z3aPgOVh_pws3T54vpj6O7V9sxaPrEwtknbpHB4qfV0',
    url: 'https://tceldhrtajoyvuijkmpe.supabase.co',
  );
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
