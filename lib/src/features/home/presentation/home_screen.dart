import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:second_memory/src/features/archive/archive_provider/archive_provider.dart';
import 'package:second_memory/src/features/home/note_provider/note_provider.dart';
import 'package:second_memory/src/utils/routing/routing.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notes = ref.watch(noteProvider);
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0.0,
          title: Text(
            'Notatki',
            style: TextStyle(
                color: Theme.of(context).textTheme.displayMedium?.color),
          ),
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
                onPressed: () {
                  context.goNamed(AppRoute.archive.name);
                },
                icon: const Icon(
                  Icons.archive,
                  color: Colors.white,
                ))
          ],
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  final note = notes[index];
                  return ListTile(
                    onTap: () {
                      context.goNamed(AppRoute.detail.name,
                          pathParameters: {'title': note.title});
                    },
                    onLongPress: () {
                      ref.read(noteProvider.notifier).deleteNoteFromMain(note);
                      ref.read(archiveProvider.notifier).showArchive();
                    },
                    title: Text(
                      note.title,
                      style: TextStyle(
                          color: Theme.of(context).textTheme.bodyMedium?.color),
                    ),
                    subtitle: Text(
                      note.body,
                      style: TextStyle(
                          color: Theme.of(context).textTheme.bodySmall?.color),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.goNamed(AppRoute.adding.name);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
