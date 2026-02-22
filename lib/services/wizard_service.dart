import 'package:hogwarts_with_flutter/supabase_config.dart';
import '../models/wizard.dart';

class WizardService {
  //Llamar a BBDD
  final _supabaseDB = SupabaseConfig.client;

  Future<List<Wizard>> getWizards() async {
    final response = await _supabaseDB.from('wizard').select('id, name, age, house_id, wand_id, house(name), wand(core, wood, length)').order('name', ascending: false);

    return response.map((e) => Wizard.fromMap(e)).toList();
  }

  Future<void> addWizard(String name, int age, String? houseId, String? wandId) async {
    await _supabaseDB.from('wizard').insert({'name': name, 'age': age, 'house_id': houseId, 'wand_id': wandId});
  }

  Future<void> updateWizard(String id, String name, int age, String? houseId, String? wandId) async {
    await _supabaseDB.from('wizard').update({'name': name, 'age': age, 'house_id': houseId, 'wand_id': wandId}).eq('id', id);
  }

  Future<void> deleteWizard(String id) async {
    await _supabaseDB.from('wizard').delete().eq('id', id);
  }
}