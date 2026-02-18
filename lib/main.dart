import 'package:flutter/material.dart';
import 'supabase_config.dart';
import 'package:hogwarts_with_flutter/screens/home_screen.dart';

void main() async {
  //Cargamos las variables de entorno
  const supabaseUrl = String.fromEnvironment('URL_SUPABASE_DB');
  const supabaseKey = String.fromEnvironment('KEY_SUPABASE_DB');

  //Inicializamos Supabase con las variables de entorno correspondientes
  await SupabaseConfig.init(supabaseUrl, supabaseKey);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hogwarts Database with Flutter",
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: const HomeScreen(),
    );
  }
}
