// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:sua_dieta/models/widgets/all.dart';
import 'package:sua_dieta/styles/components/colors.dart';
import 'package:sua_dieta/styles/components/label.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final supabase = Supabase.instance.client;

  @override
  Widget build(BuildContext context) {
    final user = supabase.auth.currentUser;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: WillPopScope(
        onWillPop: () async {
          // Remove a rota da edição de perfil da pilha do navegador.
          Navigator.popUntil(context, ModalRoute.withName('/home'));

          // Retorna true para permitir que o usuário volte para a tela inicial.
          return true;
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TopBackgroundImageModel(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 350,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Seu",
                                style: labelTextStyle["black"],
                              ),
                              Text(
                                " Perfil   ",
                                style: labelTextStyle["white"],
                              ),
                              CircleAvatar(
                                maxRadius: 20,
                                backgroundColor: buttonColor,
                                child: IconButton.filled(
                                  onPressed: () => Navigator.pushNamed(
                                      context, '/edit_account'),
                                  icon: Icon(Icons.edit),
                                  color: Colors.white,
                                  alignment: AlignmentDirectional.center,
                                  iconSize: 25,
                                ),
                              )
                            ],
                          ),
                          TextFieldModel(
                              "Nome",
                              TextEditingController(
                                  text: "${user?.userMetadata?['name']}"),
                              Icon(Icons.abc_rounded),
                              false,
                              TextInputType.text),
                          TextFieldModel(
                              "E-mail",
                              TextEditingController(text: "${user?.email}"),
                              Icon(Icons.email_rounded),
                              false,
                              TextInputType.text),
                          TextFieldModel(
                              "Senha",
                              TextEditingController(text: "SenhaDoUsuario"),
                              Icon(Icons.lock_rounded),
                              true,
                              TextInputType.text),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Suas",
                                style: labelTextStyle["black"],
                              ),
                              Text(
                                " Dietas  ",
                                style: labelTextStyle["white"],
                              ),
                              CircleAvatar(
                                maxRadius: 20,
                                backgroundColor: buttonColor,
                                child: IconButton.filled(
                                  onPressed: () =>
                                      Navigator.pushNamed(context, '/new_diet'),
                                  icon: Icon(Icons.add),
                                  color: Colors.white,
                                  alignment: AlignmentDirectional.center,
                                  iconSize: 25,
                                ),
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 25),
                            child: Column(
                              children: [
                                DietModel("images/vegetarian_diet_image.jpg",
                                    "Vegetariana", "15/09/2023", () {}),
                                DietModel("images/vegetarian_diet_image.jpg",
                                    "Vegetariana2", "15/09/2023", () {}),
                                DietModel("images/vegetarian_diet_image.jpg",
                                    "Vegetariana3", "15/09/2023", () {}),
                                DietModel("images/vegetarian_diet_image.jpg",
                                    "Vegetariana4", "15/09/2023", () {}),
                                DietModel("images/vegetarian_diet_image.jpg",
                                    "Vegetariana5", "15/09/2023", () {}),
                                DietModel("images/vegetarian_diet_image.jpg",
                                    "Vegetariana6", "15/09/2023", () {}),
                                DietModel("images/vegetarian_diet_image.jpg",
                                    "Vegetariana7", "15/09/2023", () {}),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
