import 'package:flutter/material.dart';
import 'package:TodoApp/TodoApi.dart';


class TodoRow{
  String id;
  String todoText;
  bool completed;

  TodoRow({this.id, this.todoText, this.completed = false});

  void completedTodo(){
    completed =! completed;
  }

  static Map<String, dynamic> toJson(TodoRow todoRow) {
    return{
      'title': todoRow.todoText,
      'done': todoRow.completed,
    };
  }

  static TodoRow fromJson(Map<String, dynamic> json) {
    return TodoRow(
      id: json['id'],
      todoText: json['title'],
      completed: json['done'], 
    );
  }
}

class MyState extends ChangeNotifier{
  List<TodoRow> _list = [];
  String _filterBy = 'all';

  List<TodoRow> get list => _list;

  String get filterBy => _filterBy;

  Future getList() async {
    List<TodoRow> list = await TodoApi.getTodos();
    _list = list;
    notifyListeners();
  }
  
  void addTodo(TodoRow todoRow) async {
    await TodoApi.addTodo(todoRow);
    await getList();
    notifyListeners();
  }

  void removeTodo(TodoRow todoRow) async {
    await TodoApi.deleteTodo(todoRow.id);
    await getList();
  }

  void changeTodo(TodoRow todoRow) async {
    final todoRowIndex = _list.indexOf(todoRow);
    if (_list.indexOf(todoRow) >= 0) {
      _list[todoRowIndex].completedTodo();
      await TodoApi.updateTodoCheckvalue(todoRow);
      await getList();
    } else {
      todoRow.completed = false;
      await TodoApi.updateTodoCheckvalue(todoRow);
      await getList();   
    }
  }//Denna borde kunna skrivas om snyggare kanske

  void filterTodos(String filterBy) {
    this._filterBy = filterBy;
    notifyListeners();
  }
}