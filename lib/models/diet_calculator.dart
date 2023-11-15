class DietCalculator {
  Map<String, double> calculateMacronutrients(double totalCalories) {
    // Definir as porcentagens desejadas para cada macronutriente
    double carbPercentage = 0.5;
    double fatPercentage = 0.3;
    double proteinPercentage = 0.2;

    // Calcular a quantidade de cada macronutriente em gramas
    double carbGrams = (carbPercentage * totalCalories) / 4; // 1g carb = 4 cal
    double fatGrams = (fatPercentage * totalCalories) / 9; // 1g fat = 9 cal
    double proteinGrams =
        (proteinPercentage * totalCalories) / 4; // 1g protein = 4 cal

    // Retornar os resultados
    return {
      'carbs': carbGrams,
      'fats': fatGrams,
      'proteins': proteinGrams,
    };
  }
}
