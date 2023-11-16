class Diet {
  String? name;
  List<String>? breakfast, lunch, dinner;

  Diet(
      {required this.name,
      required this.breakfast,
      required this.lunch,
      required this.dinner});

  Diet.fromMap(Map<dynamic, dynamic> map) {
    name = map['name'];
    breakfast = map['breakfast'];
    lunch = map['lunch'];
    dinner = map['dinner'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'breakfast': breakfast,
      'lunch': lunch,
      'dinner': dinner,
    };
  }

  factory Diet.fromJson(Map<String, dynamic> json) {
    return Diet(
      name: json['name'],
      breakfast: List<String>.from(json['breakfast']),
      lunch: List<String>.from(json['lunch']),
      dinner: List<String>.from(json['dinner']),
    );
  }
}
