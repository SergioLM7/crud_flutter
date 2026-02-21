import 'package:hogwarts_with_flutter/supabase_config.dart';
import '../models/wand.dart';

class WandService {

  final _supabaseDB = SupabaseConfig.client;

  Future<List<Wand>> getWands() async {
    final response = await _supabaseDB.from('wand').select();
      print('Query: ${_supabaseDB.from('wand').select()}');

    //Transformar la respuesta a objeto Wand (por eso preparamos el mapeo en la clase)
    //A futuro: habría que paginar o hacer una carga dinámica
    return response.map((wand) => Wand.fromMap(wand)).toList();
  }

  Future<void> addWand(String wood, String core, double length) async {
    await _supabaseDB.from('wand').insert({'wood': wood, 'core': core, 'length': length});
  }

  Future<void> updateWand(String id, String wood, String core, double length) async {
    await _supabaseDB.from('wand').update({'wood': wood, 'core':core, 'length': length}).eq('id', id);
  }

  Future<void> deleteWand(String id) async {
    await _supabaseDB.from('wand').delete().eq('id', id);
  }

}