import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:second_memory/src/constants.dart';
import 'package:second_memory/src/features/home/model/note_model.dart';

enum BoxEnum {
  archive,
  main,
}

class HiveFunctions {
  static final noteBox = Hive.box<NoteModel>(Constants.noteBox);
  static final archiveBox = Hive.box<NoteModel>(Constants.archiveBox);

  List<NoteModel> getNotes() {
    List<NoteModel> notes = [];
    for (NoteModel note in noteBox.values) {
      notes.add(note);
    }
    return notes;
  }

  List<NoteModel> getNotesFromArchive() {
    List<NoteModel> notes = [];
    for (NoteModel note in archiveBox.values) {
      notes.add(note);
    }
    return notes;
  }

  void addNote(NoteModel note) {
    noteBox.put(note.title, note);
  }

  void addNoteToArchive(NoteModel note) {
    archiveBox.put(note.title, note);
  }

  Future<void> deleteNote(NoteModel note) async {
    await noteBox.delete(note.title);
  }

  Future<void> deleteNoteFromArchive(NoteModel note) async {
    await archiveBox.delete(note.title);
  }

  Future<void> clearMainBox() async {
    await noteBox.clear();
  }

  Future<void> clearArchiveBox() async {
    await archiveBox.clear();
  }
}

final hiveProvider = Provider<HiveFunctions>((ref) {
  return HiveFunctions();
});
