import 'package:flutter/material.dart';
import 'supabase_config.dart';
import 'package:hogwarts_with_flutter/screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

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
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromRGBO(253,240,213,0.9),
        appBarTheme: const AppBarTheme(backgroundColor: Color.fromRGBO(255, 255, 255, 0)),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromRGBO(193,18,31, 1),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: const Color.fromRGBO(102, 155, 188, 0.3),
          foregroundColor: const Color.fromRGBO(0, 48, 73, 1),
        ),
        textTheme: TextTheme(
          headlineLarge: GoogleFonts.bagelFatOne(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: const Color.fromRGBO(120, 0, 0, 1),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
