import 'package:flutter/material.dart';
import 'package:flutter_banco_douro/services/account_service.dart';
import 'package:flutter_banco_douro/ui/styles/colors.dart';

import 'package:flutter_banco_douro/exercises/book_exercise.dart';
import 'package:flutter_banco_douro/exercises/person_exercise.dart';
import 'package:flutter_banco_douro/exercises/social_post_exercise.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
          future: AccountService().getAll(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Center(child: CircularProgressIndicator());
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              case ConnectionState.active:
                return const Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                return const Text("A operação acabou");
            }
          },
        ),
      ),
    );
  }
}
