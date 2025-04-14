import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CardListScreen(),
    );
  }
}

class CardListScreen extends StatelessWidget {
  final List<Map<String, String>> items = [
    {
      'title': 'Beautiful Sunset',
      'subtitle': 'Nature Photography',
      'description': 'A stunning sunset view captured at the beach last summer.',
      'image': 'https://picsum.photos/id/10/400/300'
    },
    {
      'title': 'Mountain View',
      'subtitle': 'Landscape',
      'description': 'Snow-capped mountains during winter season.',
      'image': 'https://picsum.photos/id/11/400/300'
    },
    {
      'title': 'Ocean Waves',
      'subtitle': 'Seascape',
      'description': 'Powerful ocean waves crashing against the rocks.',
      'image': 'https://picsum.photos/id/12/400/300'
    },
    {
      'title': 'Forest Path',
      'subtitle': 'Nature Walk',
      'description': 'A peaceful path through the dense green forest.',
      'image': 'https://picsum.photos/id/13/400/300'
    },
  ];

  CardListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animated Cards')),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: CustomCard(
              title: items[index]['title']!,
              subtitle: items[index]['subtitle']!,
              description: items[index]['description']!,
              imageUrl: items[index]['image']!,
            ),
          );
        },
      ),
    );
  }
}

class CustomCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String description;
  final String imageUrl;

  const CustomCard({super.key, 
    required this.title,
    required this.subtitle,
    required this.description,
    required this.imageUrl,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: () {
        // Handle card tap
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('You tapped ${widget.title}')),
        );
      },
      child: AnimatedScale(
        duration: Duration(milliseconds: 100),
        scale: _isPressed ? 0.98 : 1.0,
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.network(
                  widget.imageUrl,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      widget.subtitle,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      widget.description,
                      style: TextStyle(fontSize: 14),
                    ),
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