import 'dart:nativewrappers/_internal/vm/lib/ffi_native_type_patch.dart';

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
  final Double? wandLength;


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
      houseName: map['houses'] != null ? map["houses"]["name"] : null,
      wandWood: map['wands'] != null ? map["wands"]["wood"] : null,
      wandCore: map['wands'] != null ? map["wands"]["core"] : null,
      wandLength: map['wands'] != null ? map["wands"]["length"] : null
    );
  }

}