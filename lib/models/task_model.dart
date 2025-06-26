// ==================== task_model.dart ====================
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  bool done;

  @HiveField(2)
  DateTime? dueDate;

  @HiveField(3)
  int? notificationId;

  @HiveField(4)
  int? dueHour;

  @HiveField(5)
  int? dueMinute;

  Task({
    required this.title,
    this.done = false,
    this.dueDate,
    this.notificationId,
    this.dueHour,
    this.dueMinute,
  });

  TimeOfDay? get dueTime {
    if (dueHour != null && dueMinute != null) {
      return TimeOfDay(hour: dueHour!, minute: dueMinute!);
    }
    return null;
  }
}
