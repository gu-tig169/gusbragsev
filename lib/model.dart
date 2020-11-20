import 'package:flutter/material.dart';

class TodoRow{
  String todoText;
  TodoRow({this.todoText});
}

class MyState extends ChangeNotifier{
  List<TodoRow> _todo = [];

  List<TodoRow> get list => _todo;

  void addTodo(TodoRow todoRow){
    _todo.add(todoRow);
    notifyListeners();

  }
  
}