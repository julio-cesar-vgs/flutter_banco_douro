class Project {
  final String imagePath;
  final String title;
  final String description;

  Project({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}

class Experience {
  final String title;
  final String organization;
  final String? observation;
  final DateTime startDate;
  final DateTime? endDate;

  Experience({
    required this.title,
    required this.organization,
    this.observation,
    required this.startDate,
    this.endDate,
  });
}

class Resume {
  final String name;
  final String imagePath;
  final List<Experience> educationalExperiences;
  final List<Experience> professionalExperiences;
  final List<Project> projects;

  Resume({
    required this.name,
    required this.imagePath,
    required this.educationalExperiences,
    required this.professionalExperiences,
    required this.projects,
  });
}

// Instância de dados com informações fictícias para exibir a tela
final myResume = Resume(
  name: "Risoflora Mangle",
  imagePath: "assets/images/logo.png", // Usando imagem já existente no projeto
  educationalExperiences: [
    Experience(
      title: "Bacharel em Ciência da Computação",
      organization: "Universidade Federal de Pernambuco",
      startDate: DateTime(2018, 2, 1),
      endDate: DateTime(2022, 12, 15),
      observation: "TCC em Interface Humano-Computador",
    ),
  ],
  professionalExperiences: [
    Experience(
      title: "Desenvolvedora Mobile Pleno",
      organization: "App Solutions LTDA",
      startDate: DateTime(2023, 3, 1),
      observation:
          "Desenvolvimento de aplicativos multi-plataforma usando Flutter e Dart.",
    ),
  ],
  projects: [
    Project(
      title: "Banco Douro",
      imagePath:
          "assets/images/banner.png", // Usando imagem já existente no projeto
      description:
          "App de gestão de contas bancárias, desenvolvido com Flutter. Conta com layout robusto, imagens dinâmicas e formulários seguros.",
    ),
  ],
);
