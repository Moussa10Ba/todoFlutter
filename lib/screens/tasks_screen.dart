import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Model/task_data.dart';
import 'package:todo_app/screens/add_task_screen.dart';
import 'package:todo_app/widget/tasks_list.dart';

import '../constant.dart';

class TasksScreen extends StatelessWidget {
bool isChek = false;
 int todoDone = 0;
int todoNotDone = 0;
  TasksScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF29c6be),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 350,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/check.jpg"),
                fit: BoxFit.fill,
              )
            ),
            padding: const EdgeInsets.only(top: 310,),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:  [
                CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 30,
                  child: Text(
                    Provider.of<TaskData>(context).numberOfDoneTodos().toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                Text(
                  '${Provider.of<TaskData>(context).tasks.length} Tasks',
                  style: const TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                ),
                CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 40,
                  child: Text(
                    Provider.of<TaskData>(context).numberOfNotDoneTodos().toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 50),
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0))),
              child: TasksList(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => AddTaskScreen(
                      (taskTitle){
                    Navigator.pop(context);
                  }
                  ),
          );
        },
        backgroundColor: const Color(0xFF25b5be),
        child: const Icon(Icons.add),
      ),
    );
  }
}
