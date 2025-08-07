import 'package:flutter/material.dart';

// Contoh StatelessWidget sederhana
class MyApp extends StatelessWidget {
  // Konstruktor dengan key opsional
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Stateless Widget Example')),
        body: const Center(
          child: Text(
            'Saya adalah Stateless Widget!',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}
