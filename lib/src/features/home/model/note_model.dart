import 'package:hive_flutter/adapters.dart';
part 'note_model.g.dart';

@HiveType(typeId: 1)
class NoteModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String body;

  NoteModel({
    required this.title,
    required this.body,
  });

  NoteModel copyWith({
    String? title,
    String? body,
  }) {
    return NoteModel(
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }
}
