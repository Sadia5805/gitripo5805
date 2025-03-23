import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            'Hello World!',
            style: TextStyle(
              fontFamily: 'UbuntuMono',
              fontSize: 24,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}