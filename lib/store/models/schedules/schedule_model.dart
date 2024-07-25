import 'package:flutter/material.dart';

enum ScheduleState {
   pendiente,
   notificada,
   cancelada
}

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


class ScheduleModel {
  final int scheduleId;
  final String title;
  final String description;
  final String addictionalDescriptions;
  final DateTime creationDate;
  final DateTime eventDate;
  final ScheduleState state;
  final ScheduleCategory category;
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
    required this.color
  });


  Map<String, dynamic> toMap() {
    return {
      'scheduleId': scheduleId,
      'title': title,
      'description': description,
      'addictionalDescriptions': addictionalDescriptions,
      'creationDate': creationDate.toIso8601String(),
      'eventDate': eventDate.toIso8601String(),
      'state': state.index,
      'category': category.index,
      'color': color.value
    };
  }


  factory ScheduleModel.fromMap(Map<String, dynamic> map) {
    return ScheduleModel(
      scheduleId: map['scheduleId'],
      title: map['title'],
      description: map['description'],
      addictionalDescriptions: map['addictionalDescriptions'],
      creationDate: DateTime.parse(map['creationDate']),
      eventDate: DateTime.parse(map['eventDate']),
      state: ScheduleState.values[map['state']],
      category: ScheduleCategory.values[map['category']],
      color: Color(map['color'])
    );
  }
}