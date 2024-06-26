import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0.0,
          title: Text(
            'Dodaj notatkę',
            style: TextStyle(
                color: Theme.of(context).textTheme.displayMedium?.color),
          ),
          backgroundColor: Colors.transparent,
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
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50.0,
                      ),
                      TextField(
                        controller: bodyController,
                        maxLines: 4,
                        decoration: InputDecoration(
                            hintStyle: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .labelSmall
                                    ?.color),
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
              ],
            )
          ],
        ),
      ),
    );
  }
}
