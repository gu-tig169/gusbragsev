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

  String _filterBy = 'all';

  List<TodoRow> get list => _list;

  String get filterBy => _filterBy;

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

  void setFilterBy(String filterBy) {
    this._filterBy = filterBy;
    notifyListeners();
  }
}

//Lägg till checkboxvärde här 1. i Första klassen + konstruktor
//2. Lägg till kompleted task beteende här som addTodo
//3. Lägg till removeItem här också