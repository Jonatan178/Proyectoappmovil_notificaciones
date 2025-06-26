import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/task_model.dart';
import '../services/notification_service.dart';

class TaskProvider with ChangeNotifier {
  late final Box<Task> _taskBox;

  TaskProvider() {
    // La caja ya está abierta en main, la obtenemos aquí
    _taskBox = Hive.box<Task>('tasksBox');
  }

  List<Task> get tasks => _taskBox.values.toList();

  void addTask(
    String title, {
    DateTime? dueDate,
    int? dueHour,
    int? dueMinute,
    int? notificationId,
  }) {
    final newTask = Task(
      title: title,
      dueDate: dueDate,
      dueHour: dueHour,
      dueMinute: dueMinute,
      notificationId: notificationId,
    );
    _taskBox.add(newTask);
    notifyListeners();
  }

  void toggleTask(int index) {
    final task = _taskBox.getAt(index);
    if (task != null) {
      task.done = !task.done;
      task.save();
      notifyListeners();
    }
  }

  void removeTask(int index) {
    final task = _taskBox.getAt(index);
    if (task != null) {
      if (task.notificationId != null) {
        NotificationService.cancelNotification(task.notificationId!);
      }
      task.delete();
      notifyListeners();
    }
  }

  void updateTask(
    int index,
    String newTitle, {
    DateTime? newDate,
    int? newHour,
    int? newMinute,
    int? notificationId,
  }) {
    final task = _taskBox.getAt(index);
    if (task != null) {
      if (task.notificationId != null) {
        NotificationService.cancelNotification(task.notificationId!);
      }
      task.title = newTitle;
      task.dueDate = newDate;
      task.dueHour = newHour;
      task.dueMinute = newMinute;
      task.notificationId = notificationId;
      task.save();
      notifyListeners();
    }
  }
}
