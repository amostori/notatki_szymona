import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:second_memory/src/features/home/model/note_model.dart';
import 'package:second_memory/src/utils/hive_functions.dart';

class Note extends StateNotifier<List<NoteModel>> {
  Note({required this.hiveFunctions})
      : super(
          hiveFunctions.getNotes(),
        );
  final HiveFunctions hiveFunctions;

  void showNotes() {
    state = hiveFunctions.getNotes();
  }

  void addFromArchiveToMain(NoteModel note) {
    // Koniecznie trzeba stworzyć nowy obiekt, w przeciwnym wypadku będzie
    // HiveError: The same instance of an HiveObject cannot be stored in two different boxes.
    final newNote = NoteModel(title: note.title, body: note.body);
    hiveFunctions.addNote(newNote);
    state = hiveFunctions.getNotes();
  }

  void deleteNoteFromMain(NoteModel note) {
    hiveFunctions.deleteNote(note);
    hiveFunctions.addNoteToArchive(note);
    state = hiveFunctions.getNotes();
  }

  NoteModel? getNoteByTitle(String title) {
    return hiveFunctions.getNoteByTitle(title);
  }

  void addNote(NoteModel note) {
    hiveFunctions.addNote(note);
    state = hiveFunctions.getNotes();
  }

  void deleteMainBox() {
    hiveFunctions.clearMainBox();
    state = hiveFunctions.getNotes();
  }
}

final noteProvider = StateNotifierProvider<Note, List<NoteModel>>((ref) {
  final hiveFunctions = ref.watch(hiveProvider);
  return Note(hiveFunctions: hiveFunctions);
});
