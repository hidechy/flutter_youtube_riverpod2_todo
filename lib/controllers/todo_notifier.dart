import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../common/helpers/db_helper.dart';
import '../common/models/task.dart';
import '../common/utils/constants.dart';

part 'todo_notifier.g.dart';

@riverpod
class TodosNotifier extends _$TodosNotifier {
  ///
  @override
  List<Task> build() {
    return [];
  }

  ///
  Future<void> refresh() async {
    final data = await DBHelper.getItems();
    state = data.map(Task.fromJson).toList();
  }

  ///
  Future<void> addItem(Task task) async {
    await DBHelper.createItem(task);
    await refresh();
  }

  ///
  Future<void> updateTodos(
    int id,
    String title,
    String desc,
    String date,
    String startTime,
    String endTime,
  ) async {
    await DBHelper.updateItem(id, title, desc, 0, date, startTime, endTime);
    await refresh();
  }

  ///
  Future<void> deleteTodos(int id) async {
    await DBHelper.deleteItem(id);
    await refresh();
  }

  ///
  Future<void> markAsCompleted(
    int id,
    String title,
    String desc,
    String date,
    String startTime,
    String endTime,
  ) async {
    await DBHelper.updateItem(id, title, desc, 1, date, startTime, endTime);
    await refresh();
  }

  ///
  dynamic getRandomColor() {
    final random = Random();
    final randomIndex = random.nextInt(colors.length);
    return colors[randomIndex];
  }

  ///
  String getToday() {
    final today = DateTime.now();
    return today.toString().substring(0, 10);
  }

  ///
  String getTomorrow() {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return tomorrow.toString();
  }

  ///
  String dayAfterTomorrow() {
    final today = DateTime.now().add(const Duration(days: 2));
    return today.toString();
  }

  ///
  List<String> getDatesOneMonthBeforeToday() {
    final today = DateTime.now();
    final oneMonthAgo = today.subtract(const Duration(days: 30));

    final dates = <String>[];

    for (var i = 0; i < 30; i++) {
      final date = oneMonthAgo.add(Duration(days: i));
      dates.add(date.toString().substring(0, 10));
    }

    return dates;
  }

  ///
  bool getStatus(Task data) {
    bool? isCompleted;
    if (data.isCompleted == 0) {
      isCompleted = false;
    } else {
      isCompleted = true;
    }
    return isCompleted;
  }
}
