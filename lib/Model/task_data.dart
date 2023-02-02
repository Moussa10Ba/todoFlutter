import 'dart:collection';

import 'package:flutter/material.dart';
import 'task.dart';

class TaskData extends ChangeNotifier{

  final List<Task> _tasks = [];

  UnmodifiableListView<Task>  get tasks{
    return UnmodifiableListView(_tasks);
  }

   updateTask(Task task){
    task.toggleDone();
    notifyListeners();
  }

  addTask(String taskTitle){
     _tasks.add(Task(title: taskTitle));
     notifyListeners();
  }

  deleteTask(Task task){
     _tasks.remove(task);
     notifyListeners();
  }

  int numberOfDoneTodos(){
    int count = 0;
        _tasks.forEach((task) {
          if(task.isDone == true){
            count++;
          }
        });
    return count;
  }

  int numberOfNotDoneTodos(){
    int count = 0;
    _tasks.forEach((task) {
      if(task.isDone == false){
        count++;
      }
    });
    return count;
  }
}