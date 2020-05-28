import 'package:flutter/material.dart';
import 'package:todoapp2/models/taskProvider.dart';
import 'screens/taskScreen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: Colors.orange,
          ),
          home: TaskScreen()),
    );
  }
}
