import 'package:flutter/material.dart';
import 'bab3/belajar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'BelajarPage',
      routes: {'BelajarPage': (context) => const BelajarPage()},
    );
  }
}
