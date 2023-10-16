// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:sua_dieta/models/widgets/all.dart';
import 'package:sua_dieta/styles/components/label.dart';

class EditAccountPage extends StatefulWidget {
  const EditAccountPage({super.key});

  @override
  State<EditAccountPage> createState() => _EditAccountPageState();
}

class _EditAccountPageState extends State<EditAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(200, 225, 190, 1),
      body: Column(
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
                  margin: EdgeInsets.symmetric(vertical: 30),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Edite sua",
                              style: labelTextStyle["black"],
                            ),
                            Text(
                              " Conta ",
                              style: labelTextStyle["white"],
                            ),
                            Image.asset(
                              "images/pencil.png",
                              width: 35,
                              height: 35,
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 450,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextFieldModel(
                                "Digite o novo nome do Usuário",
                                TextEditingController(
                                  text: "Novo nome",
                                ),
                                Icon(Icons.abc_rounded),
                                false,
                                TextInputType.text),
                            TextFieldModel(
                                "Digite o novo e-mail",
                                TextEditingController(
                                  text: "novo_email@usuário.com",
                                ),
                                Icon(Icons.email_rounded),
                                false,
                                TextInputType.emailAddress),
                            TextFieldModel(
                                "Digite a nova senha",
                                TextEditingController(
                                  text: "dkpasokdopdskopfoasdkfopads",
                                ),
                                Icon(Icons.lock_outline_rounded),
                                true,
                                TextInputType.text),
                            TextFieldModel(
                                "Repita a Nova Senha",
                                TextEditingController(
                                  text: "dkpasokdopdskopfoasdkfopads",
                                ),
                                Icon(Icons.lock_outline_rounded),
                                true,
                                TextInputType.text),
                            ElevatedButtonModel(
                              () => Navigator.of(context).pushNamed("/profile"),
                              buttonIcon: Icon(Icons.save),
                              buttonText: "Salvar",
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
    );
  }
}
