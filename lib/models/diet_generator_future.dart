// import 'package:flutter/material.dart';
// import 'package:sua_dieta/models/diet.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class GenerateDiet extends StatefulWidget {
//   const GenerateDiet({super.key});

//   @override
//   State<GenerateDiet> createState() => _GenerateDietState();
// }

// class _GenerateDietState extends State<GenerateDiet> {
//   final supabase = Supabase.instance.client;

//   Future<Diet> generateDiet(double totalCalories, String dietType,
//       String dietName, String dietCategory) async {
//     final caloriesPerMeal = totalCalories / 3;
//     final double? carbPercentage = switch (dietType) {
//       "Emagrecer" || "Engordar" => 0.5,
//       "Manter peso" => 0.4,
//       _ => null
//     };

//     final double? fatPercentage = switch (dietType) {
//       "Engordar" || "Manter peso" => 0.2,
//       "Emagrecer" => 0.1,
//       _ => null
//     };

//     final double? proteinPercentage = switch (dietType) {
//       "Emagrecer" || "Manter peso" => 0.4,
//       "Engordar" => 0.3,
//       _ => null
//     };

//     final double? carbGrams =
//         carbPercentage != null ? (carbPercentage * caloriesPerMeal) / 4 : null;
//     final double? fatGrams = fatPercentage != null
//         ? ((fatPercentage * caloriesPerMeal) / 9) / 1000
//         : null;
//     final double? proteinGrams = proteinPercentage != null
//         ? ((proteinPercentage * caloriesPerMeal) / 4) / 1000
//         : null;

//     final dietTypeString = switch (dietType) {
//       "Café da manhã" => "C",
//       "Almoço" || "Jantar" => "AJ",
//       _ => ""
//     };

//     final future = supabase
//         .from('BancoTaco2')
//         .select(
//             'alimentos, energia, proteina, lipideos, carboidratos, categoria')
//         .filter('energia', 'lte', caloriesPerMeal)
//         .filter('categoria', 'eq', dietTypeString)
//         .filter('carboidratos', 'lte', carbGrams)
//         .filter('lipideos', 'lte', fatGrams)
//         .filter('proteina', 'lte', proteinGrams)
//         .limit(10);

//     FutureBuilder(
//       future: future,
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }

//         final dietData = snapshot.data!;

//         return Diet(name: dietName,);
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {}
// }
