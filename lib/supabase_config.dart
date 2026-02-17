
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConfig {
  // Inicializa Supabase
  static Future<void> init(url, anonKey) async {
    await Supabase.initialize(
      url: url,
      anonKey: anonKey,
    );
  }

  // Atajo para acceder al cliente
  static SupabaseClient get client => Supabase.instance.client;
}
