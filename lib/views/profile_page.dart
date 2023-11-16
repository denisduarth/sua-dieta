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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TopBackgroundImageModel(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 730,
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
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 90),
                            child: TextFieldModel(
                                "Peso",
                                TextEditingController(
                                    text: "${user?.userMetadata?['weight']}kg"),
                                Icon(Icons.monitor_weight),
                                false,
                                TextInputType.number),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 90),
                            child: TextFieldModel(
                                "Altura",
                                TextEditingController(
                                    text: "${user?.userMetadata?['height']}m"),
                                Icon(Icons.height),
                                false,
                                TextInputType.number),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 90),
                            child: TextFieldModel(
                                "IMC",
                                TextEditingController(text: bmiConverted),
                                Icon(Icons.monitor_weight),
                                false,
                                TextInputType.number),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 60),
                            child: TextFieldModel(
                                "Taxa Metabólica Basal",
                                TextEditingController(
                                    text:
                                        "${user?.userMetadata?['BMR'].toString()}"),
                                Icon(Icons.monitor_weight),
                                false,
                                TextInputType.text),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 60),
                            child: TextFieldModel(
                                "Nível de atividade física",
                                TextEditingController(
                                    text:
                                        "${user?.userMetadata?['physical_activity_level'].toString()}"),
                                Icon(Icons.monitor_weight),
                                false,
                                TextInputType.text),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            child: TextFieldModel(
                                "Calorias máximas por dia",
                                TextEditingController(
                                    text:
                                        "${user?.userMetadata?['max_calories'].toString()}"),
                                Icon(Icons.monitor_weight),
                                false,
                                TextInputType.text),
                          ),
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
                          StreamBuilder<List<Map<String, dynamic>>>(
                            stream: supabase
                                .from('diet')
                                .stream(primaryKey: ['id']).order('id',
                                    ascending: true),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData || snapshot.hasError) {
                                return Center(
                                  child: const CircularProgressIndicator(
                                    color: buttonColor,
                                  ),
                                );
                              }
                              final diets = snapshot.data!;

                              return ListView(
                                shrinkWrap: true,
                                children: diets
                                    .map(
                                      (diet) => Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(diet['id'].toString()),
                                            Text(diet['name']),
                                          ],
                                        ),
                                      ),
                                    )
                                    .toList(),
                              );
                            },
                          )
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

// Container(
//   margin: EdgeInsets.symmetric(vertical: 25),
//   child: Column(
//     children: [
//       DietModel("images/vegetarian_diet_image.jpg",
//           "Vegetariana", DateTime.now(), () {}),
//       DietModel("images/vegetarian_diet_image.jpg",
//           "Vegetariana2", DateTime.now(), () {}),
//       DietModel("images/vegetarian_diet_image.jpg",
//           "Vegetariana3", DateTime.now(), () {}),
//       DietModel("images/vegetarian_diet_image.jpg",
//           "Vegetariana4", DateTime.now(), () {}),
//       DietModel("images/vegetarian_diet_image.jpg",
//           "Vegetariana5", DateTime.now(), () {}),
//       DietModel("images/vegetarian_diet_image.jpg",
//           "Vegetariana6", DateTime.now(), () {}),
//       DietModel("images/vegetarian_diet_image.jpg",
//           "Vegetariana7", DateTime.now(), () {}),
//     ],
//   ),
// ),