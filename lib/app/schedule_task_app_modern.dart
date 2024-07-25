import 'package:flutter/material.dart';
import 'package:note_app/presentation/note_screen.dart';

class ScheduleTaskAppModern extends StatelessWidget {
  const ScheduleTaskAppModern ({super.key});

  @override
  Widget build(BuildContext context) {
   return  MaterialApp(
      title: 'Schedule Task App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData( useMaterial3: true ),
      home: const NotesScreen());
  }
}