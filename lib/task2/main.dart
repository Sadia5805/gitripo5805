import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),

    );
  }
}
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _text = 'Press the button';

  void _changeText(){
    setState(() {
      _text = 'Button pressed';
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:column(
          mainAxisAlignment:MainAxisAlignment.center,
          children:[
            Text(_text, style: TextStyle(fontSize: 24)),
            ElevatedButton(onPressed: _changeText, child: Text('press me'))
          ]
        )
      ),
    );
  }
}