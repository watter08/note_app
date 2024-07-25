import 'package:flutter/material.dart';
import 'package:note_app/store/models/schedules/schedule_model.dart';

abstract class IScheduleState extends ChangeNotifier {
  List<ScheduleModel> get schedules;

  List<ScheduleModel> findAll();
  ScheduleModel? findById({required int scheduleId});  
  void add({required ScheduleModel schedule});
  void update({required int scheduleId, required ScheduleModel schedule});
  void removeById({required int scheduleId});
}