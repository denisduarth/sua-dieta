// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   backgroundColor: backgroundColor,
    //   body: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       Expanded(
    //         child: ListView(
    //           children: [
    //             Stack(
    //               children: [
    //                 TopBackgroundImageModel(),
    //                 Container(
    //                     padding: EdgeInsets.symmetric(horizontal: 30),
    //                     margin: EdgeInsets.symmetric(vertical: 30),
    //                     child: Row(
    //                       children: [
    //                         GestureDetector(
    //                           onTap: () => FirebaseAuth.instance.signOut(),
    //                           child: Icon(Icons.logout_rounded),
    //                         ),
    //                         TextFieldModel(
    //                           "Pesquisar dieta",
    //                           null,
    //                           const Icon(Icons.search_rounded),
    //                           false,
    //                           TextInputType.text,
    //                         ),
    //                       ],
    //                     )),
    //               ],
    //             ),
    //             Container(
    //               margin: const EdgeInsets.symmetric(vertical: 15),
    //               padding: const EdgeInsets.symmetric(horizontal: 30),
    //               child: Column(
    //                 children: [
    //                   Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                     children: [
    //                       Column(
    //                         children: [
    //                           Text(
    //                             "Bem-vindo",
    //                             style: labelTextStyle["black"],
    //                           ),
    //                           Text(
    //                             "Usuário",
    //                             style: labelTextStyle["white"],
    //                           ),
    //                         ],
    //                       ),
    //                       GestureDetector(
    //                         onTap: () =>
    //                             Navigator.of(context).pushNamed("/profile"),
    //                         child: RoundedImageModel(
    //                           "images/rodrigo_goes.jpg",
    //                           80,
    //                           80,
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                   Container(
    //                     margin: EdgeInsets.symmetric(vertical: 30),
    //                     child: Column(
    //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                       children: [
    //                         Row(
    //                           mainAxisAlignment: MainAxisAlignment.center,
    //                           children: [
    //                             Text(
    //                               "Mais Recentes",
    //                               style: TextStyle(
    //                                   color: hyperTextColor,
    //                                   fontSize: 17,
    //                                   fontFamily: "Poppins",
    //                                   fontWeight: FontWeight.w600),
    //                             ),
    //                             SizedBox(
    //                               width: 10,
    //                             ),
    //                             Image.asset(
    //                               "images/vegetables_icon.png",
    //                               width: 30,
    //                               height: 30,
    //                             )
    //                           ],
    //                         ),
    //                         Container(
    //                           margin: EdgeInsets.symmetric(vertical: 10),
    //                           child: Column(
    //                             mainAxisAlignment:
    //                                 MainAxisAlignment.spaceEvenly,
    //                             children: [
    //                               DietModel(
    //                                 "images/vegetarian_diet_image.jpg",
    //                                 "Vegetariana",
    //                                 "10/10/2023",
    //                                 () {},
    //                               ),
    //                               DietModel(
    //                                 "images/low_carb_diet.jpg",
    //                                 "Low Carb",
    //                                 "11/10/2023",
    //                                 () => Navigator.of(context)
    //                                     .pushNamed("/diet"),
    //                               ),
    //                               DietModel(
    //                                 "images/low_carb_diet.jpg",
    //                                 "Low Carb 2",
    //                                 "11/10/2023",
    //                                 () {},
    //                               ),
    //                               DietModel(
    //                                 "images/low_carb_diet.jpg",
    //                                 "Low Carb 3",
    //                                 "11/10/2023",
    //                                 () {},
    //                               ),
    //                               DietModel(
    //                                 "images/low_carb_diet.jpg",
    //                                 "Low Carb 4",
    //                                 "11/10/2023",
    //                                 () {},
    //                               ),
    //                               DietModel(
    //                                 "images/low_carb_diet.jpg",
    //                                 "Low Carb 5",
    //                                 "11/10/2023",
    //                                 () {},
    //                               ),
    //                             ],
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Logado como ${FirebaseAuth.instance.currentUser?.email}'),
            ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance
                      .signOut()
                      .then((value) => Navigator.pushNamed(context, '/login'));
                },
                child: Text('Sair'))
          ],
        ),
      ),
    );
  }
}
