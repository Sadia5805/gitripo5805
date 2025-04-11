import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Custom Card App',
      home: CardListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CardListScreen extends StatelessWidget {
  const CardListScreen({super.key});

  final List<Map<String, String>> items = const [
    {
      'image':
          'https://d.newsweek.com/en/full/2547749/naruto-anniversary-artwork.jpg?w=1200&f=044c34927a514177a81067142e0aa7be',
      'title': 'Naruto',
      'subtitle': 'Action',
      'description': 'A young ninja with a dream to become the strongest.',
    },
    {
      'image':
          'https://upload.wikimedia.org/wikipedia/en/6/62/Main_characters_of_One_Piece.png',
      'title': 'One Piece',
      'subtitle': 'Adventure',
      'description': "A pirate's journey to find the ultimate treasure.",
    },
    {
      'image':
          'https://static1.srcdn.com/wordpress/wp-content/uploads/2025/01/fullmetal-alchemist-brotherhood.jpg',
      'title': 'Fullmetal Alchemist: Brotherhood',
      'subtitle': 'Fantasy',
      'description': 'Two brothers using alchemy to restore what they lost.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My favorite Animes'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: items.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final item = items[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: CustomCard(
              imageUrl: item['image']!,
              title: item['title']!,
              subtitle: item['subtitle']!,
              description: item['description']!,
            ),
          );
        },
      ),
    );
  }
}

class CustomCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String description;

  const CustomCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.description,
  });

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard>
    with SingleTickerProviderStateMixin {
  double _scale = 1.0;

  void _onTapDown(TapDownDetails details) {
    setState(() => _scale = 0.97);
  }

  void _onTapUp(TapUpDetails details) {
    setState(() => _scale = 1.0);
  }

  void _onTapCancel() {
    setState(() => _scale = 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      onTap: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Tapped on "${widget.title}"')));
      },
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeInOut,
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Image.network(
                  widget.imageUrl,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.subtitle,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 8),
                    Text(widget.description),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}