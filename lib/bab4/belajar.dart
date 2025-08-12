import 'package:flutter/material.dart';

class KalkulatorPage extends StatefulWidget {
  const KalkulatorPage({super.key});

  @override
  State<KalkulatorPage> createState() => _KalkulatorPageState();
}

class _KalkulatorPageState extends State<KalkulatorPage> {

  final TextEditingController _controllerAngka1 = TextEditingController();
  final TextEditingController _controllerAngka2 = TextEditingController();

  // Variabel untuk menyimpan hasil perhitungan atau pesan kesalahan.
  String _hasil = '0';

  // 4. Implementasikan logika perhitungan untuk setiap tombol.
  void _hitung(String operasi) {
    // Ambil nilai dari TextField dan coba konversi ke double.
    final double? angka1 = double.tryParse(_controllerAngka1.text);
    final double? angka2 = double.tryParse(_controllerAngka2.text);

    // 5. Pastikan Anda menangani kasus di mana input bukan angka.
    if (angka1 == null || angka2 == null) {
      setState(() {
        _hasil = 'Input tidak valid!';
      });
      return;
    }

    double hasilPerhitungan = 0;
    switch (operasi) {
      case '+':
        hasilPerhitungan = angka1 + angka2;
        break;
      case '-':
        hasilPerhitungan = angka1 - angka2;
        break;
      case 'x':
        hasilPerhitungan = angka1 * angka2;
        break;
      case '/':
        // 5. Penanganan pembagian dengan nol.
        if (angka2 == 0) {
          setState(() {
            _hasil = 'Tidak bisa dibagi nol!';
          });
          return;
        }
        hasilPerhitungan = angka1 / angka2;
        break;
    }

    // Perbarui Text widget hasil menggunakan setState().
    setState(() {
      // Tampilkan hasil sebagai integer jika tidak ada desimal.
      _hasil = hasilPerhitungan.toStringAsFixed(
        hasilPerhitungan.truncateToDouble() == hasilPerhitungan ? 0 : 2
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalkulator Sederhana'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 20),
              // c. Sebuah Text widget untuk menampilkan hasil perhitungan.
              Text(
                'Hasil: $_hasil',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
        
              // a. Dua TextField untuk memasukkan dua angka.
              TextField(
                controller: _controllerAngka1,
                decoration: const InputDecoration(
                  labelText: 'Masukkan Angka Pertama',
                  border: OutlineInputBorder(),
                ),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _controllerAngka2,
                decoration: const InputDecoration(
                  labelText: 'Masukkan Angka Kedua',
                  border: OutlineInputBorder(),
                ),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
              ),
              const SizedBox(height: 30),
        
              // b. Empat tombol untuk operasi.
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildOperatorButton('+'),
                  _buildOperatorButton('-'),
                  _buildOperatorButton('x'),
                  _buildOperatorButton('/'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper widget untuk membuat tombol operasi agar tidak duplikasi kode.
  Widget _buildOperatorButton(String operasi) {
    return ElevatedButton(
      onPressed: () => _hitung(operasi),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      child: Text(operasi),
    );
  }

  @override
  void dispose() {
    // Selalu dispose controller ketika widget tidak lagi digunakan untuk menghindari memory leak.
    _controllerAngka1.dispose();
    _controllerAngka2.dispose();
    super.dispose();
  }
}
