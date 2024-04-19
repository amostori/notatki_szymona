import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:second_memory/src/features/home/model/note_model.dart';

import '../../../utils/hive_functions.dart';

class Archive extends StateNotifier<List<NoteModel>> {
  Archive({required this.hiveFunctions})
      : super(hiveFunctions.getNotesFromArchive());
  final HiveFunctions hiveFunctions;

  void showArchive() {
    state = hiveFunctions.getNotesFromArchive();
  }

  void deleteNoteFromArchive(NoteModel note) {
    hiveFunctions.deleteNoteFromArchive(note);
    state = hiveFunctions.getNotesFromArchive();
  }



  void deleteArchiveBox() {
    hiveFunctions.clearArchiveBox();
    state = hiveFunctions.getNotesFromArchive();
  }
}

final archiveProvider = StateNotifierProvider<Archive, List<NoteModel>>((ref) {
  final hiveFunctions = ref.watch(hiveProvider);
  return Archive(hiveFunctions: hiveFunctions);
});
