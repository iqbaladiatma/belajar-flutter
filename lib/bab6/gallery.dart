import 'package:flutter/material.dart';

// Data dummy foto: daftar peta berisi title dan url
final List<Map<String, String>> photos = [
  {'title': 'Pegunungan', 'url': 'https://picsum.photos/id/10/600/800'},
  {'title': 'Kota Malam', 'url': 'https://picsum.photos/id/10/600/800'},
  {'title': 'Hutan Kabut', 'url': 'https://picsum.photos/id/30/600/800'},
  {'title': 'Pantai', 'url': 'https://picsum.photos/id/40/600/800'},
  {'title': 'Danau', 'url': 'https://picsum.photos/id/50/600/800'},
  {'title': 'Jembatan', 'url': 'https://picsum.photos/id/60/600/800'},
  {'title': 'Padang Rumput', 'url': 'https://picsum.photos/id/70/600/800'},
  {'title': 'Air Terjun', 'url': 'https://picsum.photos/id/80/600/800'},
  {'title': 'Gurun', 'url': 'https://picsum.photos/id/90/600/800'},
  {'title': 'Horizon', 'url': 'https://picsum.photos/id/100/600/800'},
];

// Halaman utama galeri (Bab 6)
class PhotoGalleryScreen extends StatelessWidget {
  const PhotoGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Gallery App (Bab 6)'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: photos.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5, // ubah ke 3 jika ingin 3 kolom
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            final item = photos[index];
            final title = item['title'] ?? '';
            final url = item['url'] ?? '';
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PhotoDetailScreen(title: title, imageUrl: url),
                  ),
                );
              },
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Image.network(
                        url,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// Halaman detail foto
class PhotoDetailScreen extends StatelessWidget {
  final String title;
  final String imageUrl;

  const PhotoDetailScreen({super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Image.network(
                imageUrl,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Kembali'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
