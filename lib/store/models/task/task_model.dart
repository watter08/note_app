import 'package:flutter/material.dart';

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

class TaskModel {
  final int taskId;
  final String title;
  final String description;
  final DateTime notificationDateTime;
  final TaskStatus status;
  final TaskPriority priority;
  final TaskCategory category;
  final TaskRecurrence recurrence;
  final Color color;
  final bool isCompleted;
  final DateTime creationDate;
  final String? notes;  // Optional
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
    this.location
  });

 
  Map<String, dynamic> toMap() {
    return {
      'taskId': taskId,
      'title': title,
      'description': description,
      'notificationDateTime': notificationDateTime.toIso8601String(),
      'status': status.index,
      'priority': priority.index,
      'category': category.index,
      'recurrence': recurrence.index,
      'isCompleted': isCompleted ? 1 : 0,  // SQLite uses 0 and 1 for boolean values
      'creationDate': creationDate.toIso8601String(),
      'notes': notes,
      'location': location,
      'color': color.value
    };
  }

  
  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      taskId: map['taskId'],
      title: map['title'],
      description: map['description'],
      notificationDateTime: DateTime.parse(map['notificationDateTime']),
      status: TaskStatus.values[map['status']],
      priority: TaskPriority.values[map['priority']],
      category: TaskCategory.values[map['category']],
      recurrence: TaskRecurrence.values[map['recurrence']],
      isCompleted: map['isCompleted'] == 1,
      creationDate: DateTime.parse(map['creationDate']),
      notes: map['notes'],
      location: map['location'],
      color: Color(map['color'])
    );
  }
}