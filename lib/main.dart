import 'package:flutter/material.dart';
import 'package:my_biodata/bab6/gallery.dart';

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
      // Versi simpel: langsung pakai home
      home: const PhotoGalleryScreen(),
    );
  }
}
