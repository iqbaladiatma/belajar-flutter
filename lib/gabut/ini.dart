import 'package:flutter/material.dart'; 
 
class GabutApp extends StatefulWidget { 
  const GabutApp({super.key}); 
 
  @override 
  State<GabutApp> createState() => 
_GabutAppState(); 
} 
 
class _GabutAppState extends 
State<GabutApp> { 
  String _feedback = 'Ketuk gambar!'; 
 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar( 
        title: const Text('Gesture Detector'), 
      ), 
      body: Center( 
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [ 
            GestureDetector( 
              onTap: () { // Callback ketika gambar diketuk 
                setState(() { 
                  _feedback = 'Gambar diketuk!'; 
                }); 
              }, 
              onLongPress: () { // Callback ketika gambar diketuk lama
               setState(() { 
                  _feedback = 'Gambar ditekan lama!'; 
                }); 
              }, 
              child: Image.network( 
                'https://images.unsplash.com/photo-1470167290877-7d5d3446de4c?w=800', // Contoh
                width: 200, 
                height: 200, 
                fit: BoxFit.cover, 
              ), 
            ), 
            const SizedBox(height: 20), 
            Text( 
              _feedback, 
              style: const TextStyle(fontSize: 18, 
fontWeight: FontWeight.bold), 
            ), 
          ], 
        ), 
      ), 
    ); 
  } 
}