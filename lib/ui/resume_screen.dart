import 'package:flutter/material.dart';
import 'package:flutter_banco_douro/models/resume_models.dart';

class ResumeScreen extends StatelessWidget {
  final Resume resume;

  const ResumeScreen({super.key, required this.resume});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meu Currículo"),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Cabecalho com foto e nome
            Column(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(resume.imagePath),
                  backgroundColor: Colors.grey.shade200,
                ),
                const SizedBox(height: 16),
                Text(
                  resume.name,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Educao
            _buildSectionTitle("🎓 Educação"),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: List.generate(
                resume.educationalExperiences.length,
                (index) =>
                    _buildExperienceCard(resume.educationalExperiences[index]),
              ),
            ),
            const SizedBox(height: 24),

            // Experiencia Profissional
            _buildSectionTitle("💼 Experiência Profissional"),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: List.generate(
                resume.professionalExperiences.length,
                (index) =>
                    _buildExperienceCard(resume.professionalExperiences[index]),
              ),
            ),
            const SizedBox(height: 24),

            // Projetos
            _buildSectionTitle("🚀 Projetos"),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: List.generate(
                resume.projects.length,
                (index) => _buildProjectCard(resume.projects[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.teal,
        ),
      ),
    );
  }

  Widget _buildExperienceCard(Experience exp) {
    final endDateStr = exp.endDate != null
        ? "${exp.endDate!.month}/${exp.endDate!.year}"
        : "Atual";
    final startDateStr = "${exp.startDate.month}/${exp.startDate.year}";

    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              exp.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              exp.organization,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Período: $startDateStr - $endDateStr",
              style: const TextStyle(fontSize: 14),
            ),
            if (exp.observation != null) ...[
              const SizedBox(height: 8),
              Text(exp.observation!, style: const TextStyle(fontSize: 14)),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildProjectCard(Project proj) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (proj.imagePath.isNotEmpty)
            Image.asset(
              proj.imagePath,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  proj.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(proj.description, style: const TextStyle(fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
