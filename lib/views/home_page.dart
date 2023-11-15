// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously, avoid_print

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sua_dieta/models/widgets/all.dart';
import 'package:sua_dieta/styles/components/colors.dart';
import 'package:sua_dieta/styles/components/label.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final supabase = Supabase.instance.client;

  @override
  Widget build(BuildContext context) {
    final user = supabase.auth.currentUser;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                TopBackgroundImageModel(),
              ],
            ),
            Container(
              height: 900,
              margin: const EdgeInsets.symmetric(vertical: 15),
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Bem-vindo,",
                        style: labelTextStyle["black"],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "${user?.userMetadata?['name']}",
                            style: labelTextStyle["white"],
                          ),
                          CircleAvatarModel(
                            () async {
                              if (user != null) {
                                await supabase.auth.signOut().then((value) =>
                                    Navigator.pushNamed(context, '/login'));
                              }
                            },
                            Icon(Icons.logout),
                            Colors.red,
                          ),
                          CircleAvatarModel(
                            () => Navigator.pushNamed(context, '/profile'),
                            Icon(Icons.person),
                            buttonColor,
                          )
                        ],
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Mais Recentes",
                              style: TextStyle(
                                  color: hyperTextColor,
                                  fontSize: 17,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Image.asset(
                              "images/vegetables_icon.png",
                              width: 30,
                              height: 30,
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              DietModel(
                                "images/vegetarian_diet_image.jpg",
                                "Vegetariana",
                                DateTime.now(),
                                () {},
                              ),
                              DietModel(
                                "images/low_carb_diet.jpg",
                                "Low Carb",
                                DateTime.now(),
                                () => Navigator.of(context).pushNamed("/diet"),
                              ),
                              DietModel(
                                "images/low_carb_diet.jpg",
                                "Low Carb 2",
                                DateTime.now(),
                                () {},
                              ),
                              DietModel(
                                "images/low_carb_diet.jpg",
                                "Low Carb 3",
                                DateTime.now(),
                                () {},
                              ),
                              DietModel(
                                "images/low_carb_diet.jpg",
                                "Low Carb 4",
                                DateTime.now(),
                                () {},
                              ),
                              DietModel(
                                "images/low_carb_diet.jpg",
                                "Low Carb 5",
                                DateTime.now(),
                                () {},
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
