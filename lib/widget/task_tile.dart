import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Model/task_data.dart';


class TaskTile extends StatelessWidget {
  bool isChek = false;
  late final String taskTitle;
  late final dynamic checkboxCallback;
  late final dynamic onLongPressCallback;

  TaskTile({required this.isChek, required this.taskTitle, required this.checkboxCallback, required this.onLongPressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onLongPressCallback,
        title: Text(
          taskTitle,
          style: TextStyle(
            color: Colors.white,
              decoration: isChek ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(
          value: isChek,
          fillColor: MaterialStateProperty.all(Color(0xFF25b5be)),
          activeColor: Color(0xFF25b5be),
          onChanged: checkboxCallback,
        ),
    );
  }
}












