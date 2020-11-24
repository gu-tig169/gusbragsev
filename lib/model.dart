import 'package:flutter/material.dart';

class TodoRow{
  String todoText;
  bool completed;

  TodoRow({this.todoText, this.completed = false});

  void completedTodo(){
    completed =! completed;
  }

}

class MyState extends ChangeNotifier{
  List<TodoRow> _list = [];

  List<TodoRow> get list => _list;

  void addTodo(TodoRow todoRow){
    _list.add(todoRow);
    notifyListeners();

  }

  void removeTodo(TodoRow todoRow){
    _list.remove(todoRow);
    notifyListeners();
  }

    void changeTodo(TodoRow todoRow){
    final todoRowIndex = _list.indexOf(todoRow);
    _list[todoRowIndex].completedTodo();
    notifyListeners();
  }

}

//Lägg till checkboxvärde här 1. i Första klassen + konstruktor
//2. Lägg till kompleted task beteende här som addTodo
//3. Lägg till removeItem här också