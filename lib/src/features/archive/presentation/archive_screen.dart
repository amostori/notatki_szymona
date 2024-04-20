import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: Text(
              'Archiwum X',
              style: TextStyle(
                  color: Theme.of(context).textTheme.displayMedium?.color),
            ),
          ),
          body: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.black38,
              ),
              const Image(
                image: AssetImage('assets/back.png'),
                fit: BoxFit.fill,
                opacity: AlwaysStoppedAnimation(.5),
                width: double.infinity,
                height: double.infinity,
              ),
              ListView.builder(
                  itemCount: archive.length,
                  itemBuilder: (context, index) {
                    final archiveNote = archive[index];
                    return ListTile(
                      title: Text(
                        archiveNote.title,
                        style: TextStyle(
                            color:
                                Theme.of(context).textTheme.bodyMedium?.color),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          ref
                              .read(noteProvider.notifier)
                              .addFromArchiveToMain(archiveNote);
                          context.pop();
                          _showInfoAboutAddingWord(context, archiveNote.title);
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                      onLongPress: () {
                        ref
                            .read(archiveProvider.notifier)
                            .deleteNoteFromArchive(archiveNote);
                      },
                    );
                  }),
            ],
          )),
    );
  }
}
