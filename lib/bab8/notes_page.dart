import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Bab8NotesPage extends StatefulWidget {
  const Bab8NotesPage({super.key});

  @override
  State<Bab8NotesPage> createState() => _Bab8NotesPageState();
}

class _Bab8NotesPageState extends State<Bab8NotesPage> {
  static const _prefsKey = 'notes_bab8';

  bool _loading = true;
  List<Map<String, dynamic>> _notes = [];

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  Future<void> _loadNotes() async {
    setState(() => _loading = true);
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_prefsKey);
    if (raw != null) {
      try {
        final decoded = jsonDecode(raw);
        if (decoded is List) {
          _notes = decoded
              .whereType<Map>()
              .map((e) => {
                    'title': e['title']?.toString() ?? '',
                    'content': e['content']?.toString() ?? '',
                  })
              .toList();
        }
      } catch (_) {
        // ignore invalid data
        _notes = [];
      }
    } else {
      _notes = [];
    }
    setState(() => _loading = false);
  }

  Future<void> _persist() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = jsonEncode(_notes);
    await prefs.setString(_prefsKey, raw);
  }

  Future<void> _addOrEditNote({int? index}) async {
    final isEdit = index != null;
    final titleController = TextEditingController();
    final contentController = TextEditingController();
    if (index != null) {
      titleController.text = _notes[index]['title'] as String;
      contentController.text = _notes[index]['content'] as String;
    }

    final result = await showDialog<Map<String, String>>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(isEdit ? 'Edit Catatan' : 'Catatan Baru'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Judul',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: contentController,
                decoration: const InputDecoration(
                  labelText: 'Isi Catatan',
                  border: OutlineInputBorder(),
                ),
                minLines: 3,
                maxLines: 5,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Batal'),
            ),
            FilledButton(
              onPressed: () {
                Navigator.pop<Map<String, String>>(
                  context,
                  {
                    'title': titleController.text.trim(),
                    'content': contentController.text.trim(),
                  },
                );
              },
              child: const Text('Simpan'),
            ),
          ],
        );
      },
    );

    if (result == null) return;

    setState(() {
      if (index != null) {
        _notes[index] = result;
      } else {
        _notes.insert(0, result);
      }
    });
    await _persist();
  }

  Future<void> _deleteNote(int index) async {
    setState(() {
      _notes.removeAt(index);
    });
    await _persist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catatan (Bab 8)'),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _notes.isEmpty
              ? const Center(child: Text('Belum ada catatan'))
              : ListView.builder(
                  itemCount: _notes.length,
                  itemBuilder: (context, index) {
                    final note = _notes[index];
                    final title = (note['title'] as String?)?.trim();
                    final content = (note['content'] as String?)?.trim() ?? '';
                    return ListTile(
                      title: Text(title == null || title.isEmpty ? 'Tanpa Judul' : title),
                      subtitle: Text(content, maxLines: 2, overflow: TextOverflow.ellipsis),
                      onTap: () => _addOrEditNote(index: index),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit_outlined),
                            onPressed: () => _addOrEditNote(index: index),
                            tooltip: 'Edit',
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete_outline),
                            onPressed: () => _deleteNote(index),
                            tooltip: 'Hapus',
                          ),
                        ],
                      ),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _addOrEditNote(),
        icon: const Icon(Icons.add),
        label: const Text('Tambah'),
      ),
    );
  }

}
