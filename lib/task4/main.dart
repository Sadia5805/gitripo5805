import 'package:flutter/material.dart';

void main() {
  runApp(const TextStylingApp());
}

class TextStylingApp extends StatelessWidget {
  const TextStylingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Styling Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TextStylingPage(),
    );
  }
}

class TextStylingPage extends StatelessWidget {
  const TextStylingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Styling Examples'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section 1: Basic Text Styles
            const Text(
              '1. Basic Text Styles',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Regular text',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              'Bold text',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Italic text',
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
              ),
            ),
            const Text(
              'Colored text',
              style: TextStyle(
                fontSize: 16,
                color: Colors.green,
              ),
            ),
            const Divider(height: 30, thickness: 1),

            // Section 2: Font Size Variations
            const Text(
              '2. Font Size Variations',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 10),
            const Text('Small text (12px)', style: TextStyle(fontSize: 12)),
            const Text('Medium text (16px)', style: TextStyle(fontSize: 16)),
            const Text('Large text (24px)', style: TextStyle(fontSize: 24)),
            const Text('Extra large text (32px)', style: TextStyle(fontSize: 32)),
            const Divider(height: 30, thickness: 1),

            // Section 3: Combined Styles
            const Text(
              '3. Combined Styles',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Bold & Italic',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            const Text(
              'Colored & Underlined',
              style: TextStyle(
                fontSize: 18,
                color: Colors.purple,
                decoration: TextDecoration.underline,
              ),
            ),
            const Text(
              'Custom Font & Shadow',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Roboto',
                shadows: [
                  Shadow(
                    blurRadius: 2,
                    color: Colors.grey,
                    offset: Offset(1, 1),
                ],
              ),
            ),
            const Divider(height: 30, thickness: 1),

            // Section 4: Text in Row
            const Text(
              '4. Text Styling in Row',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text('Left', style: TextStyle(color: Colors.red)),
                Text('Center', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Right', style: TextStyle(fontStyle: FontStyle.italic)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}