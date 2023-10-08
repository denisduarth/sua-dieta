import 'package:flutter/material.dart';

class UserImagePage extends StatefulWidget {
  const UserImagePage({super.key});

  @override
  State<UserImagePage> createState() => _UserImagePageState();
}

class _UserImagePageState extends State<UserImagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Adicione uma imagem")),
      body: Text("A fazer"),
    );
  }
}
