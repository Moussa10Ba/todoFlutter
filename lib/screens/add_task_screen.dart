
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Model/task.dart';
import 'package:todo_app/Model/task_data.dart';
import 'package:todo_app/constant.dart';

class AddTaskScreen extends StatelessWidget {
  final Function addTaskCallBack;

  AddTaskScreen(this.addTaskCallBack);
   final TextEditingController controller = TextEditingController();

  late String taskTitle='' ;


  @override
  Widget build(BuildContext context) {
    return  Container(
        color: Colors.grey[600],
        child: Container(
          padding: EdgeInsets.all(20),
          height: 400,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20)
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                  "Add New Task",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFF25b5be), fontSize: 25, fontWeight: FontWeight.bold),
              ),
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                style: TextStyle(),
                onChanged: (value){
                  taskTitle = value;
                },
              ),
              SizedBox(height: 5,),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFF29c6be)),
                ),
                  onPressed: (){
                  print(taskTitle);
                      Provider.of<TaskData>(context, listen: false).addTask(taskTitle);
                      Navigator.pop(context);
                  },
                  child: const Text(
                   'Add',
                    style: TextStyle(color: Colors.white),
                  ),
                  
              )
            ],
          ),
        ),
      );
  }
}
