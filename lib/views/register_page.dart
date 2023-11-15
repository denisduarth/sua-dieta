// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, sort_child_properties_last, avoid_print, library_prefixes, use_build_context_synchronously, prefer_typing_uninitialized_variables

import 'dart:math' as math;
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:sua_dieta/models/widgets/all.dart';
import 'package:sua_dieta/styles/components/colors.dart';
import 'package:sua_dieta/styles/components/label.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:image_picker/image_picker.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Uint8List? image;
  final supabase = Supabase.instance.client;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  final weightController = TextEditingController();
  final nameController = TextEditingController();
  final heightController = TextEditingController();
  final genderController = TextEditingController();
  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final weightText = weightController.text;
    final heightText = heightController.text;
    final ageText = ageController.text;
    final weight = weightText.isNotEmpty ? double.tryParse(weightText) : null;
    final height = heightText.isNotEmpty ? double.tryParse(heightText) : null;
    final age = ageText.isNotEmpty ? double.tryParse(ageText) : null;
    final bmi =
        weight != null && height != null ? weight / math.pow(height, 2) : null;
    final bmr = switch (genderController.text) {
      'M' => 10 * weight! + 6.25 * height! - 5 * age! + 5,
      'F' => 10 * weight! + 6.25 * height! - 5 * age! - 161,
      _ => null
    };
    String? tipoDieta = "Emagrecer";
    String? nivelAtividadeFisica = "Sedentário";
    List<String> tiposDieta = ["Emagrecer", "Engordar", "Manter peso"];
    List<String> niveisAtividadeFisica = [
      "Sedentário",
      "Regular",
      "Muito ativo"
    ];
    final nivelAtividadeFisicaUsuario = switch (nivelAtividadeFisica) {
      "Sedentário" => 1.2,
      "Regular" => 1.5,
      "Muito ativo" => 1.9,
      _ => null
    };

    final String categoria = bmi != null
        ? bmi < 18.5
            ? 'Abaixo do peso'
            : bmi > 18.5 && bmi <= 29.9
                ? 'Peso ideal'
                : 'Obeso'
        : '';

    Future<dynamic> pickImage(ImageSource source) async {
      final ImagePicker imagePicker = ImagePicker();
      XFile? file = await imagePicker.pickImage(
        source: source,
      );

      if (file != null) {
        return await file.readAsBytes();
      }
    }

    Future<void> selectImage() async {
      Uint8List img = await pickImage(ImageSource.gallery);
      setState(() {
        image = img;
      });
    }

    Future<void> signUp() async {
      try {
        await supabase.auth.signUp(
          password: passwordController.text,
          email: emailController.text,
          data: <String, dynamic>{
            'name': nameController.text,
            'weight': weight,
            'height': height,
            'age': age,
            'gender': genderController.text,
            'BMI': bmi,
            'BMR': bmr,
            'category': categoria,
            'physical_activity_level': nivelAtividadeFisicaUsuario,
            'max_calories': bmr! * nivelAtividadeFisicaUsuario!
          },
        );
      } on AuthException catch (error) {
        throw ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.message),
            backgroundColor: Colors.red[400],
          ),
        );
      }
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: RefreshIndicator(
        color: backgroundColor,
        backgroundColor: Colors.black,
        onRefresh: () => Future.delayed(Duration(seconds: 1)),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TopBackgroundImageModel(),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 1400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Criar",
                            style: labelTextStyle["black"],
                          ),
                          Text(
                            " Conta",
                            style: labelTextStyle["white"],
                          ),
                        ],
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
                      TextFieldModel(
                        "Digite seu nome",
                        nameController,
                        Icon(Icons.abc),
                        false,
                        TextInputType.text,
                      ),
                      TextFieldModel(
                        "Digite seu e-mail",
                        emailController,
                        Icon(Icons.email),
                        false,
                        TextInputType.emailAddress,
                      ),
                      TextFieldModel(
                        "Digite sua senha",
                        passwordController,
                        Icon(Icons.lock),
                        true,
                        TextInputType.text,
                      ),
                      TextFieldModel(
                        "Confirme sua senha",
                        passwordConfirmController,
                        Icon(Icons.lock),
                        true,
                        TextInputType.text,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Informações",
                            style: labelTextStyle["black"],
                          ),
                          Text(
                            " Adicionais",
                            style: labelTextStyle["white"],
                          ),
                        ],
                      ),
                      Container(
                        height: 200,
                        padding: EdgeInsets.symmetric(horizontal: 80),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextFieldModel(
                              "Sua altura",
                              heightController,
                              Icon(Icons.height),
                              false,
                              TextInputType.number,
                            ),
                            TextFieldModel(
                              "Seu peso",
                              weightController,
                              Icon(Icons.monitor_weight),
                              false,
                              TextInputType.number,
                            ),
                            TextFieldModel(
                              "Seu sexo",
                              genderController,
                              Icon(Icons.male),
                              false,
                              TextInputType.text,
                            ),
                            TextFieldModel(
                              "Sua idade",
                              ageController,
                              Icon(Icons.numbers),
                              false,
                              TextInputType.text,
                            ),
                            DropdownButton(
                              style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey),
                              dropdownColor: Colors.white,
                              focusColor: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              value: tipoDieta,
                              onChanged: (String? newValue) {
                                setState(
                                  () {
                                    tipoDieta = newValue!;
                                  },
                                );
                              },
                              items: tiposDieta.map((String value) {
                                return DropdownMenuItem(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                            DropdownButton(
                              style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey),
                              dropdownColor: Colors.white,
                              focusColor: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              value: nivelAtividadeFisica,
                              onChanged: (String? newValue) {
                                setState(
                                  () {
                                    nivelAtividadeFisica = newValue!;
                                  },
                                );
                              },
                              items: niveisAtividadeFisica.map((String value) {
                                return DropdownMenuItem(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButtonModel(
                        () => passwordController.text !=
                                passwordConfirmController.text
                            ? ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Senhas não coincidem!"),
                                  backgroundColor: Colors.red[400],
                                ),
                              )
                            : signUp().then((value) =>
                                Navigator.pushNamed(context, '/login')),
                        Icon(Icons.create),
                        "Criar conta",
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/login'),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 10,
                                color: buttonColor,
                              ),
                            ),
                          ),
                          child: Text(
                            'Já tem uma conta? faça login!',
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
