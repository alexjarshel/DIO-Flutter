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
  bool onlyNotClosedTask = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTask();
  }

  void getTask() async {
    if (onlyNotClosedTask) {
      _tasks = await taskRepository.listDontClosedTasks();
    } else {
      _tasks = await taskRepository.listTasks();
    }

    setState(() {});
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
                            await taskRepository.addTask(
                                Task(descriptionControler.text, false));
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
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Only not closed',
                          style: TextStyle(fontSize: 18),
                        ),
                        Switch(
                            value: onlyNotClosedTask,
                            onChanged: (bool value) {
                              onlyNotClosedTask = value;
                              getTask();
                            }),
                      ])),
              Expanded(
                child: ListView.builder(
                    itemCount: _tasks.length,
                    itemBuilder: (BuildContext bc, int index) {
                      var task = _tasks[index];
                      return Dismissible(
                        onDismissed: (DismissDirection dismissDirection) async {
                          await taskRepository.deleteTask(task.id);
                          getTask();
                        },
                        key: Key(task.id),
                        child: ListTile(
                          title: Text(task.description),
                          trailing: Switch(
                            onChanged: (bool value) async {
                              await taskRepository.changeTask(task.id, value);
                              getTask();
                            },
                            value: task.finish,
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}
