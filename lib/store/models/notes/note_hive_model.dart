import 'package:hive/hive.dart';
import 'package:flutter/material.dart';

part 'note_hive_model.g.dart'; 

@HiveType(typeId: 0) 
class NoteModel extends HiveObject {
  @HiveField(0)
  late int noteId;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final DateTime creationDate;

  @HiveField(4)
  final Color color;

  @HiveField(5)
  final String category;

  @HiveField(6)
  final String emoji;

  NoteModel({
    required this.noteId,
    required this.title,
    required this.description,
    required this.creationDate,
    required this.color,
    required this.category,
    required this.emoji
  });
}
