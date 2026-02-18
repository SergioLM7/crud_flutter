import 'package:flutter/material.dart';

class WizardsListScreen extends StatelessWidget {
  const WizardsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
          title: const Text("Wizards' list"),
        ),
        body: const Center(
          child: Text("Here we will show the wizards..."),
        )
    );
  }
}