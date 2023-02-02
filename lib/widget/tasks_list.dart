import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Model/task_data.dart';
import 'package:todo_app/widget/task_tile.dart';
import 'package:todo_app/Model/task.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (BuildContext context, taskData,  child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            var task = taskData.tasks[index];
            return TaskTile(
              isChek: task.isDone ,
              taskTitle: task.title,
              checkboxCallback: (checkboxState){
                taskData.updateTask(task);
              },
              onLongPressCallback: (){
                taskData.deleteTask(task);
              } ,
            );
          },
          itemCount: taskData.tasks.length,
        );
      },

    );
  }
}



