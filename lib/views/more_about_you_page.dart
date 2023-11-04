// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unnecessary_null_comparison

import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sua_dieta/models/widgets/all.dart';
import 'package:sua_dieta/styles/components/colors.dart';
import 'package:sua_dieta/styles/components/label.dart';

dynamic pickImage(ImageSource source) async {
  final ImagePicker imagePicker = ImagePicker();
  XFile? file = await imagePicker.pickImage(
    source: source,
  );

  if (file != null) {
    return await file.readAsBytes();
  }
}

class MoreAboutYouPage extends StatefulWidget {
  const MoreAboutYouPage({super.key});

  @override
  State<MoreAboutYouPage> createState() => _MoreAboutYouPageState();
}

class _MoreAboutYouPageState extends State<MoreAboutYouPage> {
  Uint8List? image;
  final user = FirebaseAuth.instance.currentUser;
  final alturaController = TextEditingController();
  final pesoController = TextEditingController();
  final nomeController = TextEditingController();

  Future<void> selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: RefreshIndicator(
        color: backgroundColor,
        backgroundColor: Colors.black,
        onRefresh: () => Future.delayed(Duration(seconds: 3)),
        child: SingleChildScrollView(
          child: Container(
            height: 950,
            padding: const EdgeInsets.symmetric(horizontal: 25),
            margin: const EdgeInsets.symmetric(vertical: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TopBackgroundImageModel(),
                Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Mais algumas",
                            style: labelTextStyle['black'],
                          ),
                          TextSpan(
                            text: " Informações",
                            style: labelTextStyle['white'],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                TextFieldModel(
                  'Seu nome',
                  nomeController,
                  Icon(Icons.person),
                  false,
                  TextInputType.name,
                ),
                TextFieldModel(
                  'Sua altura',
                  alturaController,
                  Icon(Icons.height),
                  false,
                  TextInputType.number,
                ),
                TextFieldModel(
                  'Seu peso',
                  pesoController,
                  Icon(Icons.monitor_weight),
                  false,
                  TextInputType.number,
                ),
                Container(
                  child: Column(
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Adicione uma",
                              style: labelTextStyle['black'],
                            ),
                            TextSpan(
                              text: " foto",
                              style: labelTextStyle['white'],
                            ),
                          ],
                        ),
                      ),
                      Stack(
                        children: [
                          image != null
                              ? CircleAvatar(
                                  backgroundImage: MemoryImage(image!),
                                  radius: 65,
                                )
                              : CircleAvatar(
                                  backgroundImage:
                                      AssetImage('images/rodrigo_goes.jpg'),
                                  radius: 65,
                                ),
                          Positioned(
                            bottom: 1,
                            left: 80,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: buttonColor,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      offset: Offset(0, 5),
                                      blurRadius: 5,
                                    )
                                  ]),
                              child: IconButton(
                                iconSize: 30,
                                onPressed: () => selectImage(),
                                icon: Icon(Icons.add_a_photo),
                                splashRadius: 50,
                                color: Colors.white,
                                highlightColor: backgroundColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ElevatedButtonModel(
                  () {
                    if (nomeController.text == null ||
                        pesoController.text == null ||
                        alturaController.text == null) {
                      return ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Há valores nulos!"),
                          backgroundColor: Colors.red[400],
                        ),
                      );
                    }
                  },
                  Icon(Icons.create),
                  'Finalizar',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
