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
              height: 1200,
              margin: const EdgeInsets.symmetric(vertical: 15),
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Bem-vindo",
                        style: labelTextStyle["black"],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
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
                              width: 50,
                              height: 50,
                            )
                          ],
                        ),
                        StreamBuilder<List<Map<String, dynamic>>>(
                          stream: supabase.from('diet').stream(
                              primaryKey: ['id']).order('id', ascending: true),
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
                                    .map((diet) => DietModel(
                                        'images/lose_weight_diet.jpg',
                                        diet['name'],
                                        DateTime.now(),
                                        () => null))
                                    .toList());
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
    );
  }
}
