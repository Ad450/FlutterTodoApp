import 'package:flutter/material.dart';
//import 'package:todoapp2/models/task.dart';
import 'package:todoapp2/taskTile.dart';
import 'package:provider/provider.dart';
import 'package:todoapp2/models/taskProvider.dart';

class TaskScreen extends StatefulWidget {
//  final String collectTaskDatafromInput;
  // TaskScreen({this.collectTaskDatafromInput});
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  DateTime now = DateTime.now();
  TextEditingController _controller = TextEditingController();
  String collectTaskData;
  //Task _task = Task();
  // static int date = int.parse(DateTime.now().toString());
  //String dateAndTime = date.toStringAsFixed(2);

  @override
  Widget build(BuildContext context) {
    // int taskIndex = Provider.of<TaskProvider>(context).taskIndex;
    int _taskLength = Provider.of<TaskProvider>(context).taskList.length;
    return Scaffold(
      appBar: AppBar(
        actions: [
          CircleAvatar(
              backgroundColor: Colors.black,
              child: Icon(Icons.list, color: Colors.orange))
        ],
        bottom: PreferredSize(
          child: Container(
            //   height: 100,
            child: Text(
              _taskLength == 0
                  ? 'You have no task in your list. Please add task'
                  : 'You have ${Provider.of<TaskProvider>(context).taskList.length} task(s) in your todo list',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          preferredSize: Size(
            0,
            100,
          ),
        ),
        elevation: 0.0,
        title: Text(
          'My Todo',
          style: TextStyle(color: Colors.black, fontSize: 50),
        ),
      ),
      // List goes here,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: Icon(Icons.add, size: 50, color: Colors.black),
        onPressed: () {
          // show a screen for new task to be added
          showModalBottomSheet(
            context: context,
            builder: (context) => Container(
              height: 500,
              color: Colors.black,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      width: 300,
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(),
                        keyboardType: TextInputType.text,
                        autofocus: true,
                        textAlign: TextAlign.center,
                        cursorColor: Colors.orange,
                        onChanged: (enteredTaskData) {
                          setState(() {
                            collectTaskData = enteredTaskData;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: () {
                        // adds new task
                        Provider.of<TaskProvider>(context)
                            .addTask(collectTaskData);
                        _controller.clear();
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.send,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => Tasktile(
          Provider.of<TaskProvider>(context).taskList[index].taskData,
          now.toString(),
          () {
            Provider.of<TaskProvider>(context).deleteTask(index);
          },
        ),
        itemCount: Provider.of<TaskProvider>(context).taskList.length,
      ),
    );
  }
}
