// import 'package:firebase_core/firebase_core.dart';
// import 'package:sua_dieta/firebase/config_files.dart';
import 'package:flutter/material.dart';
import 'package:sua_dieta/views/all.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: firebaseAndroid);
  await Supabase.initialize(
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imtxd25zYWlqb2huZWZzeGJydHVmIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTg1MTAwNTEsImV4cCI6MjAxNDA4NjA1MX0.YO065THPxorFAgiodzh39KRBvCJn55zgto50Vw1g9K0',
    url: 'https://kqwnsaijohnefsxbrtuf.supabase.co',
    authFlowType: AuthFlowType.pkce
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
        "/more_about_you": (context) => const MoreAboutYouPage(),
      },
      initialRoute: "/auth",
      debugShowCheckedModeBanner: false,
    );
  }
}
