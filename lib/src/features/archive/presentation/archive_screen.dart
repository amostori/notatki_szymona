import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:second_memory/src/features/archive/archive_provider/archive_provider.dart';
import 'package:second_memory/src/features/home/note_provider/note_provider.dart';

class ArchiveScreen extends ConsumerWidget {
  const ArchiveScreen({super.key});
  void _showInfoAboutAddingWord(BuildContext context, String word) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Dodano notatkę $word do '
            'głównej strony.')));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final archive = ref.watch(archiveProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Archiwum X'),
      ),
      body: ListView.builder(
          itemCount: archive.length,
          itemBuilder: (context, index) {
            final archiveNote = archive[index];
            return ListTile(
              title: Text(archiveNote.title),
              trailing: IconButton(
                onPressed: () {
                  ref
                      .read(noteProvider.notifier)
                      .addFromArchiveToMain(archiveNote);
                  context.pop();
                  _showInfoAboutAddingWord(context, archiveNote.title);
                },
                icon: const Icon(Icons.add),
              ),
              onLongPress: () {
                ref
                    .read(archiveProvider.notifier)
                    .deleteNoteFromArchive(archiveNote);
              },
            );
          }),
    );
  }
}
