import 'package:flutter/material.dart';
//import 'package:todoapp2/models/taskProvider.dart';
//import 'package:provider/provider.dart';
//import 'package:todoapp2/models/taskProvider.dart';
//import 'models/task.dart';

class Tasktile extends StatelessWidget {
  final bool isSelected = true;
  final String taskData;
  final Function deleteTask;
  Tasktile(this.taskData, this.now , this.deleteTask);
  final String now;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(taskData),
      subtitle: Text(now),
      trailing : IconButton(
          //this will delete the task from the task List 
        onPressed: deleteTask,
        

        
        icon: Icon(Icons.delete),
      )
    );
  }
}