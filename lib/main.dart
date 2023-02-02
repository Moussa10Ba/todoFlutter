import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Model/task_data.dart';
import 'package:todo_app/screens/add_task_screen.dart';
import 'package:todo_app/screens/tasks_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskData>(
      create: (BuildContext context) {
              return TaskData();
      },
      child: MaterialApp(
        home: TasksScreen(),
        initialRoute: 'tasklist',
        routes: {
          'tasklist': (context) => TasksScreen(),
        //  'addtask': (context) => AddTaskScreen(),
        },
      ),
    );
  }
}


