// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:sua_dieta/models/widgets/all.dart';
import 'package:sua_dieta/styles/components/colors.dart';
import 'package:sua_dieta/styles/components/label.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:core';

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
    double bmiDouble = user?.userMetadata?['BMI'];
    String bmiConverted = bmiDouble.toStringAsFixed(2);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: WillPopScope(
        onWillPop: () async {
          Navigator.popUntil(context, ModalRoute.withName('/home'));
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
                          TextFieldModel(
                              "IMC",
                              TextEditingController(text: bmiConverted),
                              Icon(Icons.lock_rounded),
                              false,
                              TextInputType.text),
                          Container(
                            width: double.infinity,
                            height: 20,
                            decoration: BoxDecoration(
                                color: switch (
                                    user?.userMetadata?['category']) {
                              'Abaixo do peso' || 'Obeso' => Colors.red,
                              'Peso ideal' => Colors.green,
                              _ => Colors.blue
                            }),
                            child: Text("${user?.userMetadata?['category']}"),
                          )
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
                                    "Vegetariana", DateTime.now(), () {}),
                                DietModel("images/vegetarian_diet_image.jpg",
                                    "Vegetariana2", DateTime.now(), () {}),
                                DietModel("images/vegetarian_diet_image.jpg",
                                    "Vegetariana3", DateTime.now(), () {}),
                                DietModel("images/vegetarian_diet_image.jpg",
                                    "Vegetariana4", DateTime.now(), () {}),
                                DietModel("images/vegetarian_diet_image.jpg",
                                    "Vegetariana5", DateTime.now(), () {}),
                                DietModel("images/vegetarian_diet_image.jpg",
                                    "Vegetariana6", DateTime.now(), () {}),
                                DietModel("images/vegetarian_diet_image.jpg",
                                    "Vegetariana7", DateTime.now(), () {}),
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
