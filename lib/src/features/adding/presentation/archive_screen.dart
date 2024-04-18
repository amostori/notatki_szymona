import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:second_memory/src/features/home/note_provider/note_provider.dart';
import 'package:second_memory/src/utils/hive_functions.dart';

class ArchiveScreen extends ConsumerWidget {
  const ArchiveScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hiveProv = ref.watch(hiveProvider);
    final archiveNotes = hiveProv.getNotesFromArchive();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Archiwum X'),
      ),
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            final archiveNote = archiveNotes[index];
            return ListTile(
              title: Text(archiveNote.title),
              trailing: IconButton(
                onPressed: () {
                  ref
                      .read(noteProvider.notifier)
                      .addFromArchiveToMain(archiveNote);
                },
                icon: const Icon(Icons.add),
              ),
              onLongPress: () {
                ref
                    .read(noteProvider.notifier)
                    .deleteNoteFromArchive(archiveNote);
              },
            );
          }),
    );
  }
}
