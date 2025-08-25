import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class ProfileCard extends StatefulWidget {
  const ProfileCard({super.key});

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile '),
      ),

      // ⁡⁣⁣⁢bagian UI nya ⁡
      body: Center(
        child: Column(
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


      //⁡⁣⁣⁢ bagian tekx⁡
      const SizedBox(height: 10),
      const Text(
        'Flutter Developer',
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      
      const Spacer(), // ⁡⁣⁣⁢dorong icon ke bawah⁡
      Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
             Icon(FontAwesomeIcons.github, color: Colors.black),
            SizedBox(width: 10),
            Icon(FontAwesomeIcons.linkedin, color: Colors.black),
            SizedBox(width: 10),
            Icon(FontAwesomeIcons.instagram, color: Colors.black),
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
