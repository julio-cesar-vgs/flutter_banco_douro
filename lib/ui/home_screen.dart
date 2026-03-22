import 'package:flutter/material.dart';
import 'package:flutter_banco_douro/ui/styles/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sistema de gestão de contas"),
        backgroundColor: AppColor.secondaryColor,
        leading: IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () {
            Navigator.pushReplacementNamed(context, "login");
          },
        ),
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
