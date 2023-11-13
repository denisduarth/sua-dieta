import 'package:flutter/material.dart';
import 'package:sua_dieta/styles/components/colors.dart';
import 'package:sua_dieta/views/all.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: FutureBuilder<AuthState>(
          future: Supabase.instance.client.auth.onAuthStateChange.first,
          builder: (context, snapshot) {
            return !snapshot.hasData ? const LoginPage() : const HomePage();
          },
        ),
      ),
    );
  }
}


// @override
// Widget build(BuildContext context) {
//   return StreamBuilder<AuthState>(
//     stream: Supabase.instance.client.auth.onAuthStateChange,
//     builder: (context, snapshot) {
//       return !snapshot.hasData ? const LoginPage() : const HomePage();
//     },
//   );
// }

// : snapshot.hasError
//     ? Text('Erro: ${snapshot.error}')
//     : !snapshot.hasData
//         ? const LoginPage()
//         : const HomePage();