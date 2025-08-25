import 'package:flutter/material.dart';
import 'package:my_biodata/bab3/belajar.dart';
import 'package:my_biodata/bab4/belajar.dart';
import 'package:my_biodata/bab7/photo_app.dart';
import 'package:my_biodata/bab8/belajar.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // tentukan route awal (misalnya Bab8 → PhotoApp)
      initialRoute: 'PhotoApp',

      routes: {
        'BelajarPage': (context) => const BelajarPage(),
        'Kalkulate': (context) => const KalkulatorPage(),
        'KalkulatorPage': (context) => const KalkulatorPage(),
        'GalleryApp': (context) => const PhotoListScreen(),
        'PhotoApp': (context) => const NotesPage(),
      },
    );
  }
}
