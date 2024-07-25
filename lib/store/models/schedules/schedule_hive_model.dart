// schedule_model.dart
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'schedule_hive_model.g.dart'; // Archivo generado por hive_generator

enum ScheduleState { pendiente, notificada, cancelada }

enum ScheduleCategory {
  trabajo,
  personal,
  salud,
  educacion,
  finanzas,
  recados,
  familia,
  pasatiempos,
  otro
}

@HiveType(typeId: 1) 
class ScheduleModel extends HiveObject {
  @HiveField(0)
  final int scheduleId;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final String addictionalDescriptions;

  @HiveField(4)
  final DateTime creationDate;

  @HiveField(5)
  final DateTime eventDate;

  @HiveField(6)
  final ScheduleState state;

  @HiveField(7)
  final ScheduleCategory category;

  @HiveField(8)
  final Color color;

  ScheduleModel({
    required this.scheduleId,
    required this.title,
    required this.description,
    required this.addictionalDescriptions,
    required this.creationDate,
    required this.eventDate,
    required this.state,
    required this.category,
    required this.color,
  });
}
