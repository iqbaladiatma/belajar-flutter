import 'package:flutter/material.dart';
import 'package:my_biodata/bab8/notes_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Belajar Flutter',
      // Versi simpel: langsung pakai home
      home: const Bab8NotesPage(),
    );
  }
}
