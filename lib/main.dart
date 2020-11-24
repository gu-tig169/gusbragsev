import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'TodoListView.dart';
import 'package:TodoApp/model.dart';

void main() {
  var state = MyState();
  runApp(
    ChangeNotifierProvider(
      create: (context) => state,
      child: MyApp()
      ),
    );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoListView(),
    );
  }
}

// TODO: 
// - Lösa Consumer så att man kan ta emot todoRow på första sidan CHECK
// - Lösa så att checkbox går att checka CHECK
// - Lösa så att Radera går att radera
// - Lösa så att det kan skapas filterval
// - Ev. göra ett streck över färdigcheckade rader
//
//



