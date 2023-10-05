import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const SuaDieta());
}

class SuaDieta extends StatelessWidget{
  const SuaDieta({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}