import 'package:flutter/material.dart';

class BelajarPage extends StatefulWidget {
  const BelajarPage({super.key});

  @override
  State<BelajarPage> createState() => _BelajarPageState();
}

class _BelajarPageState extends State<BelajarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile '),
      ),

      // ⁡⁣⁣⁢bagian UI nya ⁡
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center, // posisi tengah vertikal
          children: [
          
     Container(
  width: 400, // lebar container
  height: 400, // tinggi container
  decoration: BoxDecoration(
    color: Colors.lightBlueAccent,
    borderRadius: BorderRadius.circular(10),
    
  ),
  child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      const SizedBox(height: 20), // jarak atas
      ClipOval(
        child: Image.asset(
          'img/image11.jpg',
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      ),
      const SizedBox(height: 15),
      const Text(
        'Abdurrohman',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 10),
      const Text(
        'Flutter Developer',
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      const Spacer(), // dorong icon ke bawah
      Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.home, color: Colors.white),
            SizedBox(width: 10),
            Icon(Icons.settings, color: Colors.white),
            SizedBox(width: 10),
            Icon(Icons.person, color: Colors.white),
          ],
        ),
      ),
    ],
  ),
)









          ],
        ),
      ),

    );
  }
}
