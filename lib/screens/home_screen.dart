import 'package:flutter/material.dart';
import '../screens/wizards_list_screen.dart';
import '../screens/wands_list_screen.dart';
import '../screens/houses_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hogwarts Students Manager"),
      ),
      body: Padding(padding: const EdgeInsets.all(16.0),
        child: GridView.count(crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20,
        children: [
          _buildHomeCard(context, //es un objeto nuevo porque no existe el Widget y lo tengo que construir
            title: "Wizards",
            icon: Icons.rowing,
            color: Colors.blue,
            target: const WizardsListScreen(),
          ), 
          _buildHomeCard(context,
            title: "Wands",
            icon: Icons.auto_fix_high,
            color: Colors.deepPurple,
            target: const WandsListScreen()
          ), 
          _buildHomeCard(context,
            title: "Houses",
            icon: Icons.castle,
            color: const Color.fromARGB(255, 250, 64, 17),
            target: const HousesListScreen()
          ),
        ]
        )
        ),
        );
  }
  
}

Widget _buildHomeCard(
  BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
    required Widget target,
  }) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => target)),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 5,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: color.withValues(alpha: 0.3), //transparencia 30%
            //esto es para que el fondo del botón sea un color pastel, con poca opacidad
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icono grande
              Icon(icon, size: 50, color: color),
              const SizedBox(height: 12), //br
              // Texto
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

      )
    );
  }