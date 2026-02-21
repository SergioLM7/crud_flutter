import 'package:hogwarts_with_flutter/supabase_config.dart';
import '../models/wizard.dart';

class WizardService {
  //Llamar a BBDD
  final _supabaseDB = SupabaseConfig.client;

  Future<List<Wizard>> getWizards() async {
    final response = await _supabaseDB.from('wizards').select('id, name, age, house_id, wand_id, houses(name), wands(core, wood, length)').order('name', ascending: false);

    return response.map((e) => Wizard.fromMap(e)).toList();
  }

  Future<void> addWizard(String name, int age, String? houseId, String? wandId) async {
    await _supabaseDB.from('wizards').insert({'name': name, 'age': age, 'houseId': houseId, 'wandId': wandId});
  }

  Future<void> updateWizard(String id, String name, int age, String? houseId, String? wandId) async {
    await _supabaseDB.from('wizards').update({'name': name, 'age': age, 'houseId': houseId, 'wandId': wandId}).eq('id', id);
  }

  Future<void> deleteWizard(String id) async {
    await _supabaseDB.from('wizards').delete().eq('id', id);
  }
}