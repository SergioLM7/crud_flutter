class House {
  final String id;
  final String name;
  final String founder;

  House({
    required this.id,
    required this.name,
    required this.founder,
  });

  factory House.fromMap(Map<String, dynamic> map) {
    return House(
      id: map['id'] as String,
      name: map['name'] as String,
      founder: map['founder'] as String,
    );
  }

}