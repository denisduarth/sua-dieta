// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, avoid_unnecessary_containers, must_be_immutable

import 'package:flutter/material.dart';
import 'package:sua_dieta/models/widgets/all.dart';
import 'package:sua_dieta/styles/components/colors.dart';
import 'package:sua_dieta/styles/components/label.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DietPage extends StatefulWidget {
  int dietId;
  DietPage({required this.dietId, super.key});

  @override
  State<DietPage> createState() => _DietPageState();
}

class _DietPageState extends State<DietPage> {
  final supabase = Supabase.instance.client;

  @override
  Widget build(BuildContext context) {
    final future = supabase
        .from('diet')
        .select()
        .match({'id': widget.dietId})
        .limit(1)
        .single();

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TopBackgroundImageModel(),
            Container(
              alignment: AlignmentDirectional.center,
              height: 650,
              padding: EdgeInsets.symmetric(horizontal: 30),
              margin: EdgeInsets.symmetric(vertical: 10),
              child: FutureBuilder(
                future: future,
                builder: (context, snapshot) {
                  if (!snapshot.hasData || snapshot.hasError) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final dietData = snapshot.data!;

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Dieta Nº: ${dietData['id']}",
                        style: labelTextStyle['black'],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "'${dietData['name']}'",
                        style: labelTextStyle['white'],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 40),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 15),
                              child: Column(children: [
                                Text(
                                  "Café da manhã",
                                  style: labelTextStyle['black_minimal'],
                                ),
                                Text("Ingredientes do café da manhã")
                              ]),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 30),
                              child: Column(children: [
                                Text(
                                  "Almoço",
                                  style: labelTextStyle['white_minimal'],
                                ),
                                Text("Ingredientes do almoço")
                              ]),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 30),
                              child: Column(children: [
                                Text(
                                  "Café da manhã",
                                  style: labelTextStyle['black_minimal'],
                                ),
                                Text("Ingredientes da janta")
                              ]),
                            ),
                            Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black26,
                                        offset: Offset(0, 0),
                                        blurRadius: 5)
                                  ]),
                              margin: EdgeInsets.only(top: 40),
                              child:
                                  Wrap(direction: Axis.horizontal, children: [
                                Text(
                                  "ATENÇÃO USUÁRIO: Todas as dietas geradas por este aplicativo não devem ser colocadas como dietas OFICIAIS. Para uma dieta mais bem elaborada, segura e que atenda suas necessidades, procure um especialista neste assunto",
                                  style: TextStyle(
                                      color: Colors.black26,
                                      fontFamily: 'Poppins',
                                      fontSize: 12),
                                ),
                              ]),
                            )
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
