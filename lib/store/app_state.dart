import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/store/adapters/colors_adapter.dart';
import 'package:note_app/store/models/notes/note_hive_model.dart';

 initialazingDatabase() async {
   await Hive.initFlutter();
   Hive.registerAdapter(MaterialColorAdapter());
   Hive.registerAdapter(NoteModelAdapter());
}