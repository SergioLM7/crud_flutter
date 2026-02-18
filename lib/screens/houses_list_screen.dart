import 'package:flutter/material.dart';

class HousesListScreen extends StatelessWidget {
  const HousesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
          title: const Text("Houses' list"),
        ),
        body: const Center(
          child: Text("Here we will show the houses..."),
        )
    );
  }
}