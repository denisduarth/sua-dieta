// ignore_for_file: avoid_unnecessary_containers, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:sua_dieta/models/diet.dart';
import 'package:sua_dieta/models/diet_generator.dart';
import 'package:sua_dieta/models/widgets/all.dart';
import 'package:sua_dieta/styles/components/colors.dart';
import 'package:sua_dieta/styles/components/label.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

String? dietSelected = "Emagrecer";
const List<String> filters = ["Emagrecer", "Engordar", "Manter peso"];

class NewDietPage extends StatefulWidget {
  const NewDietPage({super.key});

  @override
  State<NewDietPage> createState() => _NewDietPageState();
}

class _NewDietPageState extends State<NewDietPage> {
  final generator = DietGenerator();
  final supabase = Supabase.instance.client;
  final dietNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = supabase.auth.currentUser;
    final double? userMaxCalories = user?.userMetadata?['max_calories'];
    final dietName = dietNameController.text.toString();

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TopBackgroundImageModel(),
            Container(
              height: 450,
              margin: const EdgeInsets.symmetric(vertical: 15),
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Nova ",
                              style: labelTextStyle['black'],
                            ),
                            TextSpan(
                              text: "Dieta ",
                              style: labelTextStyle['white'],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  TextFieldModel(
                    "Nome da dieta",
                    dietNameController,
                    const Icon(Icons.abc),
                    false,
                    TextInputType.text,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Config. da ",
                        style: labelTextStyle["black"],
                      ),
                      Text(
                        "dieta",
                        style: labelTextStyle["white"],
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        DropdownButton(
                          style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey),
                          dropdownColor: Colors.white,
                          focusColor: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          value: dietSelected,
                          onChanged: (String? newDietSelected) {
                            setState(
                              () {
                                dietSelected = newDietSelected!;
                              },
                            );
                          },
                          items: filters.map((String value) {
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
                    () async {
                      if (userMaxCalories != null) {
                        final generatedDiet = await generator.generateDiet(
                            userMaxCalories,
                            dietSelected!.toString(),
                            dietName);
                        await supabase.from('diet').insert({
                          'name': generatedDiet.name,
                          'breakfast': generatedDiet.breakfast,
                          'lunch': generatedDiet.lunch,
                          'dinner': generatedDiet.dinner,
                        });
                        Navigator.pushNamed(context, '/profile');
                      }
                    },
                    const Icon(Icons.add),
                    "Gerar nova dieta",
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
