import 'package:flutter/material.dart';
import 'package:flutter_banco_douro/ui/styles/colors.dart';
import 'package:flutter_banco_douro/ui/widgets/account_widgets.dart';

import '../models/account.dart';

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
        padding: const EdgeInsets.all(16),
        child: AccountWidgets(
          account: Account(
            id: "1",
            name: "Julio",
            lastName: "Cesar",
            balance: 1000,
            accountType: "Corrente",
          ),
        ),
      ),
    );
  }
}
