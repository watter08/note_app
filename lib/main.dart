import 'package:flutter/material.dart';
import 'package:note_app/app/schedule_task_app_modern.dart';
import 'package:provider/provider.dart';
import 'package:note_app/store/app_state.dart';
import 'package:note_app/store/services/notes/notes_services.dart';
import 'package:toastification/toastification.dart';


void main() async {
  await initialazingDatabase();
  runApp( ListenableProvider(
    create: (context) => NoteStateService(),
    child: const ToastificationWrapper(
      child:  ScheduleTaskAppModern()
    )
  ));
}