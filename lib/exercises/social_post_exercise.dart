import 'dart:math';
import 'package:flutter/material.dart';

class SocialPost {
  final String postId;
  final String author;
  final String content;
  final DateTime timestamp;
  final String? imagePath;
  int likes;
  List<String> comments;

  SocialPost({
    required this.postId,
    required this.author,
    required this.content,
    required this.timestamp,
    this.imagePath, // Campo opcional que pode ser nulo
    this.likes = 0,
    this.comments = const [],
  });

  // Método para curtir a postagem
  void like() {
    likes++;
  }

  // Método para adicionar um comentário
  void addComment(String comment) {
    comments.add(comment);
  }

  // Método para obter o tempo desde a postagem
  String timeAgo() {
    final duration = DateTime.now().difference(timestamp);
    if (duration.inMinutes < 60) {
      return '${duration.inMinutes} minutes ago';
    } else if (duration.inHours < 24) {
      return '${duration.inHours} hours ago';
    } else {
      return '${duration.inDays} days ago';
    }
  }

  // Método estático para obter um exemplo da classe
  static SocialPost getExample() {
    return [getExampleWithImage(), getExampleWithoutImage()][Random().nextInt(
      2,
    )];
  }

  static SocialPost getExampleWithImage() {
    return SocialPost(
      postId: 'POST124',
      author: 'Isa',
      content: 'Loving the new design of our app!',
      timestamp: DateTime.now().subtract(const Duration(hours: 2)),
      imagePath: 'assets/post123.png', // Exemplo com uma imagem associada
      likes: 42,
      comments: ['Looks great!', 'Can’t wait to try it!', 'Awesome work!'],
    );
  }

  static SocialPost getExampleWithoutImage() {
    return SocialPost(
      postId: 'POST123',
      author: 'Isa',
      content: "I'm working in a brand-new app. 💻",
      timestamp: DateTime.now().subtract(const Duration(hours: 5)),
      likes: 42,
      comments: ['Wow, interesting...', "Let me take a peek!"],
    );
  }
}

class SocialPostWidget extends StatefulWidget {
  final SocialPost post;

  const SocialPostWidget({super.key, required this.post});

  @override
  State<SocialPostWidget> createState() => _SocialPostWidgetState();
}

class _SocialPostWidgetState extends State<SocialPostWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.grey.shade50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cabeçalho: Autor e tempo
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.indigoAccent,
                  child: Text(
                    widget.post.author[0].toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.post.author,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      widget.post.timeAgo(),
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.more_vert, color: Colors.grey),
              ],
            ),
            const SizedBox(height: 12),
            // Conteúdo do Post
            Text(
              widget.post.content,
              style: const TextStyle(fontSize: 15, height: 1.4),
            ),
            // Imagem (se houver)
            if (widget.post.imagePath != null) ...[
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  widget.post.imagePath!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 180,
                    width: double.infinity,
                    color: Colors.grey.shade200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.broken_image, color: Colors.grey, size: 40),
                        SizedBox(height: 8),
                        Text(
                          "Imagem não encontrada",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
            const SizedBox(height: 12),
            const Divider(),
            // Rodapé: Curtidas e Comentários
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  onPressed: () {
                    setState(() {
                      widget.post.like();
                    });
                  },
                  icon: const Icon(
                    Icons.favorite_border,
                    color: Colors.redAccent,
                  ),
                  label: Text(
                    "${widget.post.likes} Curtidas",
                    style: const TextStyle(color: Colors.black87),
                  ),
                ),
                TextButton.icon(
                  onPressed: () {
                    // Simulação para abrir comentários
                  },
                  icon: const Icon(
                    Icons.chat_bubble_outline,
                    color: Colors.blueAccent,
                  ),
                  label: Text(
                    "${widget.post.comments.length} Comentários",
                    style: const TextStyle(color: Colors.black87),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
