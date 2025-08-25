import 'package:flutter/material.dart';

// ------------------------ MODEL ------------------------
class Photo {
  final int id;
  final String title;
  final String url;

  Photo({required this.id, required this.title, required this.url});
}

// ------------------------ FUNGSI AMBIL DATA ------------------------
Future<List<Photo>> fetchPhotos() async {
  await Future.delayed(const Duration(seconds: 1)); // simulasi loading

  return [
    Photo(
      id: 1,
      title: "Pink Beach",
      url:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRV3yKH9U9elAVmxlu5n6Iiajdv_saLkfF8uA&s",
    ),
    Photo(
      id: 2,
      title: "Rinjani Mountain",
      url:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtUQP1fcri6v3WXMCyJ4qrEOMnVyAaRpMTIQ&s",
    ),
  ];
}

// ------------------------ MAIN APP ------------------------
void main() {
  runApp(const PhotoApp());
}

class PhotoApp extends StatelessWidget {
  const PhotoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Photo Gallery",
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const PhotoListScreen(),
    );
  }
}

// ------------------------ HALAMAN LIST ------------------------
class PhotoListScreen extends StatelessWidget {
  const PhotoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Photo Gallery"),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Photo>>(
        future: fetchPhotos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Tidak ada data"));
          }

          final photos = snapshot.data!;
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: photos.length,
            itemBuilder: (context, index) {
              final photo = photos[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                child: ListTile(
                  contentPadding: const EdgeInsets.all(12),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      photo.url,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    photo.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PhotoDetailScreen(photo: photo),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// ------------------------ HALAMAN DETAIL ------------------------
class PhotoDetailScreen extends StatelessWidget {
  final Photo photo;
  const PhotoDetailScreen({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(photo.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(photo.url, fit: BoxFit.cover),
            ),
            const SizedBox(height: 20),
            Text(
              photo.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              "Foto dengan ID: ${photo.id}",
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
