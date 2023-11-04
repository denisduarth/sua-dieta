// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:sua_dieta/models/widgets/all.dart';
import 'package:sua_dieta/styles/components/colors.dart';
import 'package:sua_dieta/styles/components/label.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: WillPopScope(
        onWillPop: () async {
          // Remove a rota da edição de perfil da pilha do navegador.
          Navigator.popUntil(context, ModalRoute.withName('/home'));

          // Retorna true para permitir que o usuário volte para a tela inicial.
          return true;
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView(
                children: [
                  Stack(
                    children: [
                      TopBackgroundImageModel(),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 120),
                        child: RoundedImageModel(
                          "images/rodrigo_goes.jpg",
                          150,
                          150,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    margin: const EdgeInsets.only(bottom: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                    " Perfil ",
                                    style: labelTextStyle["white"],
                                  ),
                                  Image.asset("images/user_icon.png",
                                      width: 35, height: 35),
                                ],
                              ),
                              TextFieldModel(
                                  "Nome",
                                  TextEditingController(
                                      text: "Nome do usuário"),
                                  Icon(Icons.abc_rounded),
                                  false,
                                  TextInputType.text),
                              TextFieldModel(
                                  "E-mail",
                                  TextEditingController(
                                      text: "usuario@usuario.com"),
                                  Icon(Icons.email_rounded),
                                  false,
                                  TextInputType.text),
                              TextFieldModel(
                                  "Senha",
                                  TextEditingController(
                                      text: "dasiofjoisdjfioadjsiofsaj"),
                                  Icon(Icons.lock_rounded),
                                  true,
                                  TextInputType.text),
                            ],
                          ),
                        ),
                        ElevatedButtonModel(
                          () =>
                            Navigator.of(context).pushNamed("/edit_account"),
                            Icon(Icons.edit_rounded),
                            "Editar perfil",
                        ),
                        Container(
                          height: 950,
                          padding: EdgeInsets.symmetric(vertical: 30),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
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
                                    " Dietas ",
                                    style: labelTextStyle["white"],
                                  ),
                                  Image.asset("images/vegetables_icon_2.png",
                                      width: 50, height: 50),
                                ],
                              ),
                              ElevatedButtonModel(
                                () => Navigator.of(context)
                                    .pushNamed("/new_diet"),
                                Icon(Icons.add),
                                "Nova Dieta",
                                
                              ),
                              Container(
                                // height: 800,
                                child: Column(
                                  children: [
                                    DietModel(
                                        "images/vegetarian_diet_image.jpg",
                                        "Vegetariana",
                                        "15/09/2023",
                                        () {}),
                                    DietModel(
                                        "images/vegetarian_diet_image.jpg",
                                        "Vegetariana2",
                                        "15/09/2023",
                                        () {}),
                                    DietModel(
                                        "images/vegetarian_diet_image.jpg",
                                        "Vegetariana3",
                                        "15/09/2023",
                                        () {}),
                                    DietModel(
                                        "images/vegetarian_diet_image.jpg",
                                        "Vegetariana4",
                                        "15/09/2023",
                                        () {}),
                                    DietModel(
                                        "images/vegetarian_diet_image.jpg",
                                        "Vegetariana5",
                                        "15/09/2023",
                                        () {}),
                                    DietModel(
                                        "images/vegetarian_diet_image.jpg",
                                        "Vegetariana6",
                                        "15/09/2023",
                                        () {}),
                                    DietModel(
                                        "images/vegetarian_diet_image.jpg",
                                        "Vegetariana7",
                                        "15/09/2023",
                                        () {}),
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
          ],
        ),
      ),
    );
  }
}
