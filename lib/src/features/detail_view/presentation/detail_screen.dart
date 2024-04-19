import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:second_memory/src/features/home/note_provider/note_provider.dart';

class DetailScreen extends ConsumerWidget {
  const DetailScreen({super.key, required this.noteTitle});
  final String noteTitle;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final note = ref.read(noteProvider.notifier).getNoteByTitle(noteTitle);

    return Scaffold(
      appBar: AppBar(
        title: note == null ? const Text('') : Text(note.title),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(noteProvider.notifier).deleteNoteFromMain(note!);
              context.pop();
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
            child: note == null ? const Text('') : Text(note.body)),
      ),
    );
  }
}
