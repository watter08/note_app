import 'package:flutter/material.dart';
import 'package:note_app/store/models/task/task_model.dart';


abstract class ITaskState extends ChangeNotifier {
  List<TaskModel> get tasks;

  List<TaskModel> findAll();
  TaskModel? findById({required int taskId});  
  void add({required TaskModel task});
  void update({required int taskId, required TaskModel task});
  void removeById({required int taskId});
}