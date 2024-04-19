import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:second_memory/src/features/home/model/note_model.dart';
import 'package:second_memory/src/features/home/note_provider/note_provider.dart';
import 'package:second_memory/src/utils/routing/routing.dart';

class AddingScreen extends ConsumerWidget {
  AddingScreen({super.key});
  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dodaj notatkę'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 30.0,
            ),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                  labelText: 'Tytuł', border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 30.0,
            ),
            TextField(
              controller: bodyController,
              maxLines: null,
              decoration: const InputDecoration(
                  labelText: 'Treść', border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
              onPressed: () {
                if (titleController.text.isNotEmpty &&
                    bodyController.text.isNotEmpty) {
                  final title = titleController.text;
                  final body = bodyController.text;
                  final note = NoteModel(title: title, body: body);
                  ref.read(noteProvider.notifier).addNote(note);
                  context.goNamed(AppRoute.home.name);
                }
              },
              child: const Text('Zapisz'),
            ),
          ],
        ),
      ),
    );
  }
}
