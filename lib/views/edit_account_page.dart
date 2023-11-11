// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, sort_child_properties_last, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:sua_dieta/models/widgets/all.dart';
import 'package:sua_dieta/styles/components/colors.dart';
import 'package:sua_dieta/styles/components/label.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EditAccountPage extends StatefulWidget {
  const EditAccountPage({super.key});

  @override
  State<EditAccountPage> createState() => _EditAccountPageState();
}

class _EditAccountPageState extends State<EditAccountPage> {
  final supabase = Supabase.instance.client;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<void> updateUser() async {
    try {
      await supabase.auth.updateUser(
        UserAttributes(
          email: emailController.text,
          password: passwordController.text,
          data: {'name': nameController.text},
        ),
      );
    } on AuthException catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message),
          backgroundColor: Colors.red[400],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TopBackgroundImageModel(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Edite seus",
                          style: labelTextStyle["black"],
                        ),
                        Text(
                          " dados",
                          style: labelTextStyle["white"],
                        ),
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
                            nameController,
                            Icon(Icons.abc_rounded),
                            false,
                            TextInputType.text),
                        TextFieldModel(
                            "Digite o novo e-mail",
                            emailController,
                            Icon(Icons.email_rounded),
                            false,
                            TextInputType.emailAddress),
                        TextFieldModel(
                            "Digite a nova senha",
                            passwordController,
                            Icon(Icons.lock),
                            true,
                            TextInputType.text),
                        TextFieldModel(
                            "Repita a Nova Senha",
                            confirmPasswordController,
                            Icon(Icons.lock),
                            true,
                            TextInputType.text),
                        ElevatedButtonModel(
                          () {
                            return passwordController.text !=
                                    confirmPasswordController.text
                                ? ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Senhas não coincidem!"),
                                      backgroundColor: Colors.red[400],
                                    ),
                                  )
                                : updateUser()
                                    .then((value) =>
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                "Dados atualizados com sucesso!"),
                                            backgroundColor: Colors.green[400],
                                          ),
                                        ))
                                    .then((value) => Navigator.pushNamed(
                                        context, '/profile'));
                          },
                          Icon(Icons.save),
                          "Salvar",
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
