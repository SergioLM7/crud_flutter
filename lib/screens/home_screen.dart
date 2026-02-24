import 'package:flutter/material.dart';
import '../screens/wizards_list_screen.dart';
import '../screens/wands_list_screen.dart';
import '../screens/houses_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final headerStyle = Theme.of(context).textTheme.headlineLarge;
    final colorWizards = Theme.of(context).colorScheme.primary;
    final colorHouses = Theme.of(context).colorScheme.secondary;
    final colorWands = Theme.of(context).colorScheme.surface;

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Hogwarts Manager", style: headerStyle)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2, 
          mainAxisSpacing: 20, 
          crossAxisSpacing: 20,
          children: [
            HomeCard(
              title: "Wizards",
              icon: Icons.people,
              color: colorWizards,
              target: WizardsListScreen(),
            ),
            HomeCard(
              title: "Wands",
              icon: Icons.auto_fix_high,
              color: colorWands,
              target: WandsListScreen(),
            ),
            HomeCard(
              title: "Houses",
              icon: Icons.castle,
              color: colorHouses,
              target: HousesListScreen(),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget independiente para aprovechar el renderizado de Flutter
class HomeCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final Widget target;

  const HomeCard({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.target,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias, // Optimiza bordes redondeados
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 5,
      color: color.withValues(alpha: 0.3),
      child: InkWell( // Mejor que GestureDetector para feedback visual
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => target)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: "${title}_hero",
              child: Icon(icon, size: 50, color: color)
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontSize: 18,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}