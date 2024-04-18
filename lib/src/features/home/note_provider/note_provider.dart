import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:second_memory/src/features/home/model/note_model.dart';
import 'package:second_memory/src/utils/hive_functions.dart';

class Note extends StateNotifier<List<NoteModel>> {
  Note({required this.hiveFunctions})
      : super(
          hiveFunctions.getNotes(),
        );
  final HiveFunctions hiveFunctions;

  void deleteNoteFromMain(NoteModel note) {
    hiveFunctions.deleteNote(note);
    hiveFunctions.addNoteToArchive(note);
    state = hiveFunctions.getNotes();
  }

  void deleteNoteFromArchive(NoteModel note) {
    hiveFunctions.deleteNoteFromArchive(note);
  }

  void addNote(NoteModel note) {
    hiveFunctions.addNote(note);
    state = hiveFunctions.getNotes();
  }

  void addFromArchiveToMain(NoteModel note) {
    hiveFunctions.addNote(note);
    // state = hiveFunctions.getNotes();
  }

  void deleteMainBox() {
    hiveFunctions.clearMainBox();
    state = hiveFunctions.getNotes();
  }

  void deleteArchiveBox() {
    hiveFunctions.clearArchiveBox();
  }
}

final noteProvider = StateNotifierProvider<Note, List<NoteModel>>((ref) {
  final hiveFunctions = ref.watch(hiveProvider);
  return Note(hiveFunctions: hiveFunctions);
});
