import 'package:flutter/material.dart';
import 'package:my_biodata/bab5/product_detail_screen.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  // Data produk sederhana (hardcode) menggunakan Map agar lebih simpel
  List<Map<String, dynamic>> get products => const [
        {
          'name': 'Kopi Arabika',
          'price': 45000.0,
          'description':
              'Kopi Arabika premium dengan cita rasa fruity dan keasaman seimbang.',
          'imageUrl':
              'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=800',
        },
        {
          'name': 'Teh Hijau',
          'price': 30000.0,
          'description':
              'Teh hijau alami, menyegarkan, kaya antioksidan untuk kesehatan.',
          'imageUrl':
              'https://images.unsplash.com/photo-1470167290877-7d5d3446de4c?w=800',
        },
        {
          'name': 'Cokelat Hitam 85%',
          'price': 52000.0,
          'description':
              'Cokelat hitam premium 85% kakao, pahit manis dengan aroma intens.',
          'imageUrl':
              'https://images.unsplash.com/photo-1470167290877-7d5d3446de4c?w=800',
        },
      ];

  @override
  Widget build(BuildContext context) {
    final list = products;
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Produk')),
      body: ListView.separated(
        itemCount: list.length,
        separatorBuilder: (_, __) => const Divider(height: 0),
        itemBuilder: (context, index) {
          final p = list[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(p['imageUrl'] as String),
            ),
            title: Text(p['name'] as String),
            subtitle:
                Text('Rp ${(p['price'] as double).toStringAsFixed(0)}'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Navigasi menggunakan MaterialPageRoute (sederhana)
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetailScreen(product: p),
                ),
              );
            },
          );
        },
      ),
    );
  }
}