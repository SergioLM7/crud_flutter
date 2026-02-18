import 'package:flutter/material.dart';

class WandsListScreen extends StatelessWidget {
  const WandsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
          title: const Text("Wands' list"),
        ),
        body: const Center(
          child: Text("Here we will show the wands..."),
        )
    );
  }
}