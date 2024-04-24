import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:second_memory/src/features/home/note_provider/note_provider.dart';

class DetailScreen extends ConsumerWidget {
  const DetailScreen({super.key, required this.noteTitle});
  final String noteTitle;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final note = ref.read(noteProvider.notifier).getNoteByTitle(noteTitle);

    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: note == null
                ? const Text('')
                : Text(
                    note.title,
                    style: TextStyle(
                        color:
                            Theme.of(context).textTheme.displayMedium?.color),
                  ),
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
              Column(
                children: [
                  const SizedBox(
                    height: 100.0,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SingleChildScrollView(
                          child:
                              note == null ? const Text('') : Text(note.body)),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
