import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/store/adapters/colors_adapter.dart';
import 'package:note_app/store/models/notes/note_hive_model.dart';
import 'package:note_app/store/models/schedules/schedule_hive_model.dart';
import 'package:note_app/store/models/task/task_hive_model.dart';

 initialazingDatabase() async {
   await Hive.initFlutter();
   Hive.registerAdapter(MaterialColorAdapter());
   Hive.registerAdapter(NoteModelAdapter());
   Hive.registerAdapter(ScheduleModelAdapter());
   Hive.registerAdapter(TaskModelAdapter());
}