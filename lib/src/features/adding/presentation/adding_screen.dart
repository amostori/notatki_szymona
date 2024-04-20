import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:second_memory/src/features/home/model/note_model.dart';
import 'package:second_memory/src/features/home/note_provider/note_provider.dart';
import 'package:second_memory/src/utils/routing/routing.dart';

class AddingScreen extends ConsumerWidget {
  AddingScreen({super.key});
  // final titleController = TextEditingController();
  final bodyController = TextEditingController();
  void _showInfoAboutDot(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Notatka musi zawierać kropkę (.)')));
  }

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
            // const SizedBox(
            //   height: 30.0,
            // ),
            // TextField(
            //   controller: titleController,
            //   decoration: const InputDecoration(
            //       labelText: 'Tytuł', border: OutlineInputBorder()),
            // ),
            const SizedBox(
              height: 15.0,
            ),
            TextField(
              controller: bodyController,
              maxLines: 4,
              decoration: const InputDecoration(
                  hintText:
                      'Pierwsze zdanie zakończ kropką. Będzie tytułem notatki.',
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 15.0,
            ),
            ElevatedButton(
              onPressed: () {
                if (bodyController.text.isNotEmpty &&
                    bodyController.text.contains('.')) {
                  final title = bodyController.text.split('.')[0];
                  final body = bodyController.text;
                  final note = NoteModel(title: title, body: body);
                  ref.read(noteProvider.notifier).addNote(note);
                  context.goNamed(AppRoute.home.name);
                } else {
                  if (!bodyController.text.contains('.')) {
                    _showInfoAboutDot(context);
                    return;
                  }
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
