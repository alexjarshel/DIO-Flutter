import 'package:first_proect_dio/model/task.dart';

class TaskRepository {
  List<Task> _tasks = [];

  Future<void> addTask(Task task) async {
    await Future.delayed(const Duration(seconds: 1));
    _tasks.add(task);
  }

  void changeTask(String id, bool finsih) async {
    await Future.delayed(const Duration(seconds: 1));
    _tasks.where((element) => element.getId() == id).first.setFinish(finsih);
  }

  Future<List<Task>> listTasks() async {
    Future.delayed(const Duration(seconds: 1));

    return _tasks;
  }
}
