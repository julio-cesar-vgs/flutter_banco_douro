import 'package:flutter/material.dart';
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BookWidget(book: Book.getExample()),
            PersonWidget(person: Person.getExample()),
            SocialPostWidget(post: SocialPost.getExampleWithoutImage()),
            SocialPostWidget(post: SocialPost.getExampleWithImage()),
          ],
        ),
      ),
    );
  }
}
