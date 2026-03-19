import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home - Banco Douro"),
        backgroundColor: const Color(0xFFFFA902),
      ),
      body: const Center(
        child: Text(
          "Bem-vindo ao Banco Douro!",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
