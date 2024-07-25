import 'dart:collection';

import 'package:note_app/store/models/notes/note_hive_model.dart';

abstract class INoteStateService {
  UnmodifiableListView<NoteModel> get notes;
  Future<void> getAllItems();
  Future<void> filterItems(bool Function(NoteModel note) filterFunction);
  Future<void> getItemById({required int noteId});
  Future<void> createItem({required NoteModel note});
  Future<void> updateItem({required int noteId, required NoteModel note});
  Future<void> removeItem({required int noteId});
}