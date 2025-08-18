import 'package:flutter/material.dart';
import 'package:my_biodata/bab4/belajar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: 'KalkulatorPage',
      routes: {'KalkulatorPage': (context) => const KalkulatorPage()},
    );
  }
}
