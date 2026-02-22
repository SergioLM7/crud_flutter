class Wizard {

  final String id;
  final String name;
  final int age;
  final String? houseId;
  final String? wandId;
  
  //Campos con el JOIN(opcionales)
  final String? houseName;
  final String? wandWood;
  final String? wandCore;
  final double? wandLength;


  Wizard({
    required this.id,
    required this.name,
    required this.age,
    this.houseId,
    this.wandId,
    this.houseName,
    this.wandWood,
    this.wandCore,
    this.wandLength
  });


  factory Wizard.fromMap(Map<String, dynamic> map) {
    return Wizard(
      id: map['id'] as String,
      name: map['name'] as String,
      age: map['age'] as int,
      houseId: map['house_id'],
      wandId: map['wand_id'],
      houseName: map['house'] != null ? map["house"]["name"] : null,
      wandWood: map['wand'] != null ? map["wand"]["wood"] : null,
      wandCore: map['wand'] != null ? map["wand"]["core"] : null,
      wandLength: map['wand'] != null ? map["wand"]["length"] : null
    );
  }

}