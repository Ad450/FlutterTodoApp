import 'task.dart';
import 'package:flutter/foundation.dart';

class TaskProvider extends ChangeNotifier{
//String taskMessage;
int taskIndex;
Task task = Task();

  /* String get taskMessage {
    return task.taskData;
  } */

    set taskMessageFromTask(String taskData ) {
    //  Task taskMessage = Task(taskData: taskData);
   }

  List<Task> taskList = [
    //Task(taskData: 'first todo message')
  ]; 

  void deleteTask(int currentIndex){
    taskList.removeAt(currentIndex);
    notifyListeners();
    
  }

  void addTask(String enteredTask){
    taskList.add(Task(taskData: enteredTask));
    notifyListeners();
  }

  // DateTime changeDateFormat (DateTime now){
    
  // }
}