
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/store/interfaces/notes/i_notes_service.dart';
import 'package:note_app/store/models/notes/note_hive_model.dart';

class NoteStateService extends ChangeNotifier implements INoteStateService {
  List<NoteModel> _notes = [];

  @override
  UnmodifiableListView<NoteModel> get notes => 
    UnmodifiableListView(_notes);

    final String noteHiveBox = 'note-box';

    @override
    Future<void> getAllItems() async {
      Box<NoteModel> box = await Hive.openBox<NoteModel>(noteHiveBox);
      _notes = box.values.toList();
      notifyListeners();
    }

     @override
     Future<void> filterItems(bool Function(NoteModel note) filterFunction) async {
      Box<NoteModel> box = await Hive.openBox<NoteModel>(noteHiveBox);
      _notes = box.values.where((note) => filterFunction(note)).toList();
      notifyListeners();
    }

    @override
    Future<void> getItemById({ required int noteId }) async {
      Box<NoteModel> box = await Hive.openBox<NoteModel>(noteHiveBox);
      _notes = box.values.firstWhere((note) => note.noteId == noteId) as List<NoteModel>;
      notifyListeners();
    }    

    @override
    Future<void> createItem({ required NoteModel note }) async {
      Box<NoteModel> box = await Hive.openBox<NoteModel>(noteHiveBox);
      note.noteId = box.length;
      await box.add(note);
      _notes = box.values.toList();
      notifyListeners();
    }

    @override
    Future<void> updateItem({ required int noteId , required NoteModel note }) async {
      Box<NoteModel> box = await Hive.openBox<NoteModel>(noteHiveBox);
      final noteFound = box.values.firstWhere((note) => note.noteId == noteId);
      await box.put(noteFound.key, note);
      _notes = box.values.toList();
      notifyListeners();
    }

    @override
    Future<void> removeItem({ required int noteId }) async {
      Box<NoteModel> box = await Hive.openBox<NoteModel>(noteHiveBox);
      final note = box.values.firstWhere((note) => note.noteId == noteId);
      await box.delete(note.key);
      _notes = box.values.toList();
      notifyListeners();
    }
}