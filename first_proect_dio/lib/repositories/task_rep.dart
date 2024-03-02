import 'package:first_proect_dio/model/task.dart';

class TaskRepository {
  List<Task> _tasks = [];

  Future<void> addTask(Task task) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _tasks.add(task);
  }

  Future<void> changeTask(String id, bool finsih) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _tasks.where((element) => element.id == id).first.finish = finsih;
  }

  Future<void> deleteTask(
    String id,
  ) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _tasks.remove(_tasks.where((element) => element.id == id).first);
  }

  Future<List<Task>> listTasks() async {
    Future.delayed(const Duration(microseconds: 100));

    return _tasks;
  }

  Future<List<Task>> listDontClosedTasks() async {
    Future.delayed(const Duration(milliseconds: 100));

    return _tasks.where((task) => !task.finish).toList();
  }
}
