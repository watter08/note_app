import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'task_hive_model.g.dart';// Archivo generado por hive_generator

enum TaskStatus { activa, ejecutando, completada, cancelada }
enum TaskPriority { bajo, mediana, alta }
enum TaskRecurrence { ninguna, diaria, semanal, mensual, anual }
enum TaskCategory {
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

@HiveType(typeId: 2) 
class TaskModel extends HiveObject {
  @HiveField(0)
  final int taskId;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final DateTime notificationDateTime;

  @HiveField(4)
  final TaskStatus status;

  @HiveField(5)
  final TaskPriority priority;

  @HiveField(6)
  final TaskCategory category;

  @HiveField(7)
  final TaskRecurrence recurrence;

  @HiveField(8)
  final Color color;

  @HiveField(9)
  final bool isCompleted;

  @HiveField(10)
  final DateTime creationDate;

  @HiveField(11)
  final String? notes;  // Optional

  @HiveField(12)
  final String? location;  // Optional

  TaskModel({
    required this.taskId,
    required this.title,
    required this.description,
    required this.notificationDateTime,
    required this.status,
    required this.priority,
    required this.category,
    required this.recurrence,
    required this.color,
    this.isCompleted = false,
    required this.creationDate,
    this.notes,
    this.location,
  });
}
