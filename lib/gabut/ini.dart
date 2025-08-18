import 'package:flutter/material.dart';

class GabutApp extends StatefulWidget {
  const GabutApp({super.key});

  @override
  State<GabutApp> createState() => _GabutAppState();
}

class _GabutAppState extends State<GabutApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Text('Gabut App'),
        ),
        body: Center(
          child: Text(
            "Halosaasasaasasaaaaaasasiahbdwhaibdahaaaaaaaaaasasanjidewbeeeeeeeebbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb",
            // maxLines: 2,
            // overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              backgroundColor: Colors.amber,
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              letterSpacing: 10,
              wordSpacing: 10,
              height: 2,
              fontFamily: 'Stick',
            ),
            )
        ),
      ),
    );
  }
}

class Orang {
  String name;

  Orang(this.name);
}