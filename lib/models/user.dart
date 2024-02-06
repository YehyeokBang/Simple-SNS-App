class User {
  final String? name;
  final int? age;
  final int? birthday;
  final String? sex;

  User(
      {required this.name,
      this.age,
      required this.birthday,
      required this.sex});

  User copyWith({String? name, int? age, int? birthday, String? sex}) {
    return User(
      name: name ?? this.name,
      age: age ?? this.age,
      birthday: birthday ?? this.birthday,
      sex: sex ?? this.sex,
    );
  }
}
