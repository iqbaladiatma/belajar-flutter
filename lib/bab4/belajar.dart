import 'package:flutter/material.dart';

class KalkulatorPage extends StatefulWidget {
  const KalkulatorPage({super.key});

  @override
  State<KalkulatorPage> createState() => _KalkulatorPageState();
}

class _KalkulatorPageState extends State<KalkulatorPage> {

  // variable state dan controller
  final TextEditingController _controllerAngka1 = TextEditingController();
  final TextEditingController _controllerAngka2 = TextEditingController();

  // variable untuk menampung hasil
  String _hasil = '0';

  // fungsi logika aritmatika ini.
  void _hitung(String operasi) {
    final double? angka1 = double.tryParse(_controllerAngka1.text);
    final double? angka2 = double.tryParse(_controllerAngka2.text);
   if (angka1 == null || angka2 == null) {
    setState(() {
      _hasil = 'Masukin input yaa....';
    });
    return;
   } 
   double hasilPerhitungan = 0.0;
   switch (operasi) {
    case 'tambah':
      hasilPerhitungan = angka1 + angka2;
      break;
    case 'kurang':
      hasilPerhitungan = angka1 - angka2;
      break;
    case 'kali':
      hasilPerhitungan = angka1 * angka2;
      break;
    case 'bagi':
      if(angka2 == 0) {
        setState(() {
          _hasil = 'Tidak bisa dibagi nol';
          return;
        });
    hasilPerhitungan = angka1 / angka2;
    break;
      }
   }
   setState(() {
    _hasil = hasilPerhitungan.toString();
   });
   }

  @override
  // tampilan ui di sini
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalkulator Simpel'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
          // 1. widget untuk menampilkan hasil
          Text(
            'Hasil: $_hasil', // hubungkan dengan variabel _hasil
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),

          // 2. textfield untuk angka pertama
          TextField(
            controller: _controllerAngka1, // hubungkan dengan controller diatas tadi
            decoration: const InputDecoration(
              labelText: 'Angka pertama',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          // 3. textfield untuk angka kedua
          TextField(
            controller: _controllerAngka2,
            decoration: const InputDecoration(
              labelText: 'Angka kedua',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 24),

          // 4. baris buat tombol-tombol
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: () => _hitung('tambah'), child: const Text('Tambah')),
              ElevatedButton(onPressed: () => _hitung('kurang'), child: const Text('Kurang')),
              ElevatedButton(onPressed: () => _hitung('kali'), child: const Text('Kali')),
              ElevatedButton(onPressed: () => _hitung('bagi'), child: const Text('Bagi')),
            ],
          ),
          ]
        ),
      ),
    );
  }
}