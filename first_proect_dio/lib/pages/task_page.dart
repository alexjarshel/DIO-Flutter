import 'package:first_proect_dio/model/task.dart';
import 'package:first_proect_dio/repositories/task_rep.dart';
import 'package:flutter/material.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  var descriptionControler = TextEditingController();
  var taskRepository = TaskRepository();
  var _tasks = const <Task>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTask();
  }

  void getTask() async {
    _tasks = await taskRepository.listTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          descriptionControler.text = '';
          showDialog(
              context: context,
              builder: (BuildContext bc) {
                return AlertDialog(
                  title: Text('Add new Task'),
                  content: TextField(
                    controller: descriptionControler,
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Cancel')),
                    TextButton(
                        onPressed: () async {
                          await taskRepository
                              .addTask(Task(descriptionControler.text, false));
                          setState(() {});
                          Navigator.pop(context);
                        },
                        child: Text('save'))
                  ],
                );
              });
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: _tasks.length,
          itemBuilder: (BuildContext bc, int index) {
            var task = _tasks[index];
            return Text(task.getDescription());
          }),
    );
  }
}
