import 'package:flutter/material.dart';
import 'package:flutter_banco_douro/ui/login_screen.dart';
import 'package:flutter_banco_douro/ui/home_screen.dart';

import 'package:flutter_banco_douro/ui/resume_screen.dart';
import 'package:flutter_banco_douro/models/resume_models.dart';

void main() {
  runApp(const BancoDouroApp());
}

class BancoDouroApp extends StatelessWidget {
  const BancoDouroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "login": (context) => const LoginScreen(),
        "home": (context) => const HomeScreen(),
        "resume": (context) => ResumeScreen(resume: myResume),
      },
      initialRoute: "login",
    );
  }
}
