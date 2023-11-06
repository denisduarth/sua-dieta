class Diet {
  int? id;
  String? name;
  List<String>? breakfast, lunch, dinner;

  Diet(this.name, this.breakfast, this.lunch, this.dinner);

  Diet.fromMap(Map<dynamic, dynamic> map) {
    id = map['id'];
    name = map['name'];
    breakfast = map['breakfast'];
    lunch = map['lunch'];
    dinner = map['dinner'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'breakfast': breakfast,
      'lunch': lunch,
      'dinner': dinner,
    };
  }
}
