// ignore_for_file: avoid_print

import 'package:sua_dieta/models/diet.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DietGenerator {
  final supabase = Supabase.instance.client;

  Future<Diet> generateDiet(
      double totalCalories, String dietType, String dietName) async {
    // Definir as porcentagens desejadas para cada macronutriente
    List<String> breakfastList = [];
    List<String> lunchList = [];
    List<String> dinnerList = [];
    final caloriesPerMeal = totalCalories / 3;
    final double? carbPercentage = switch (dietType) {
      "Emagrecer" || "Engordar" => 0.5,
      "Manter peso" => 0.4,
      _ => null
    };

    final double? fatPercentage = switch (dietType) {
      "Engordar" || "Manter peso" => 0.2,
      "Emagrecer" => 0.1,
      _ => null
    };

    final double? proteinPercentage = switch (dietType) {
      "Emagrecer" || "Manter peso" => 0.4,
      "Engordar" => 0.3,
      _ => null
    };

    /*
      Pegar a quantidade de calorias totais da refeição e
      Calcular a quantidade de cada macronutriente em gramas

      1g carb = 4 cal
      1g fat = 9 cal
      1g protein = 4 cal
    */
    final double? carbGrams =
        carbPercentage != null ? (carbPercentage * caloriesPerMeal) / 4 : null;
    final double? fatGrams = fatPercentage != null
        ? ((fatPercentage * caloriesPerMeal) / 9) / 1000
        : null;
    final double? proteinGrams = proteinPercentage != null
        ? ((proteinPercentage * caloriesPerMeal) / 4) / 1000
        : null;

    final responseBreakfast = await supabase
        .from('BancoTaco2')
        .select(
            'alimentos, energia, proteina, lipideos, carboidratos, categoria')
        .filter('energia', 'lte', caloriesPerMeal)
        .filter('categoria', 'in', ['C'])
        .filter('carboidratos', 'lte', carbGrams)
        .filter('lipideos', 'lte', fatGrams)
        .filter('proteina', 'lte', proteinGrams)
        .limit(10);

    final responseLunch = await supabase
        .from('BancoTaco2')
        .select(
            'alimentos, energia, proteina, lipideos, carboidratos, categoria')
        .filter('energia', 'lte', caloriesPerMeal)
        .filter('categoria', 'in', ['AJ'])
        .filter('carboidratos', 'lte', carbGrams)
        .filter('lipideos', 'lte', fatGrams)
        .filter('proteina', 'lte', proteinGrams)
        .limit(10);

    final responseDinner = await supabase
        .from('BancoTaco2')
        .select(
            'alimentos, energia, proteina, lipideos, carboidratos, categoria')
        .filter('energia', 'lte', caloriesPerMeal)
        .filter('categoria', 'in', ['AJ'])
        .filter('carboidratos', 'lte', carbGrams)
        .filter('lipideos', 'lte', fatGrams)
        .filter('proteina', 'lte', proteinGrams)
        .limit(10);

    print(responseBreakfast);
    print(responseLunch);
    print(responseDinner);

    if (responseBreakfast != null &&
        responseLunch != null &&
        responseDinner != null) {
      final List<dynamic> responseBreakfastData = responseBreakfast;
      final List<dynamic> responseLunchData = responseLunch;
      final List<dynamic> responseDinnerData = responseDinner;

      responseBreakfastData.shuffle();
      responseLunchData.shuffle();
      responseDinnerData.shuffle();

      breakfastList = responseBreakfastData
          .map((row) => row['alimentos'].toString())
          .toList();
      lunchList =
          responseLunchData.map((row) => row['alimentos'].toString()).toList();
      dinnerList =
          responseDinnerData.map((row) => row['alimentos'].toString()).toList();
    }
    return Diet(
        name: dietName,
        breakfast: breakfastList,
        lunch: lunchList,
        dinner: dinnerList);
  }
}
