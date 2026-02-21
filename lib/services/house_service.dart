import '../supabase_config.dart';
import '../models/house.dart';

class HouseService {
  //Llamar a BBDD
  final _supabaseDB = SupabaseConfig.client;

  //Devolver una lista de casas. 
  //La quiero cuando el servidor de la BBDD me responda con ella. Esto es un future/promise
  Future<List<House>> getHouses() async {
    final response = await _supabaseDB.from('house').select();
    //Transformar la respuesta a objeto House (por eso preparamos el mapeo en la clase)
    return response.map((house) => House.fromMap(house)).toList();
  }

  Future<void> addHouse(String name, String founder) async {
    await _supabaseDB.from('house').insert({'name': name, 'founder': founder});
  }

  Future<void> updateHouse(String id, String name, String founder) async {
    await _supabaseDB.from('house').update({'name': name, 'founder': founder}).eq('id', id);
  }

  Future<void> deleteHouse(String id) async {
    await _supabaseDB.from('house').delete().eq('id', id);
  }
}