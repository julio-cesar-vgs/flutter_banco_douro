import 'package:flutter/material.dart';

class Person {
  String imagePath;
  String id;
  String name;
  String lastName;
  String number;
  String cpf;
  DateTime birthday;
  DateTime registeredAt;

  Person({
    required this.imagePath,
    required this.id,
    required this.name,
    required this.lastName,
    required this.number,
    required this.cpf,
    required this.birthday,
    required this.registeredAt,
  });

  // Método estático para obter um exemplo da classe
  static Person getExample() {
    return Person(
      imagePath: "assets/levi.png",
      id: "A_NICE_GENERATED_ID",
      name: "Levi",
      lastName: "Ackerman",
      number: "+5581912345678",
      cpf: "123.456.789-00",
      birthday: DateTime.parse("1846-02-10"),
      registeredAt: DateTime.now(),
    );
  }
}

class PersonWidget extends StatelessWidget {
  final Person person;

  const PersonWidget({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Imagem de destaque com avatar
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.blueAccent.withOpacity(0.1),
              backgroundImage: AssetImage(person.imagePath),
              onBackgroundImageError:
                  (
                    exception,
                    stackTrace,
                  ) {}, // Fallback se a imagem não existir
              child: const Icon(
                Icons.person,
                size: 40,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(width: 16),
            // Informações da pessoa usando um layout flexível e organizado
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${person.name} ${person.lastName}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.badge, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        person.cpf,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.phone, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        person.number,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    children: [
                      Chip(
                        label: Text(
                          "ID: ${person.id.length > 8 ? person.id.substring(0, 8) : person.id}",
                          style: const TextStyle(fontSize: 11),
                        ),
                        padding: EdgeInsets.zero,
                        backgroundColor: Colors.grey.shade200,
                      ),
                      Chip(
                        label: Text(
                          "Desde ${person.registeredAt.day}/${person.registeredAt.month}/${person.registeredAt.year}",
                          style: const TextStyle(fontSize: 11),
                        ),
                        padding: EdgeInsets.zero,
                        backgroundColor: Colors.blue.shade50,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
