import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './AddTodoView.dart';
import './model.dart';
import './TodoList.dart';

class TodoListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        title: Text('TODO'),
        backgroundColor: Colors.green[200],
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              Provider.of<MyState>(context, listen: false).filterTodos(value);
            },
            itemBuilder: (context) => [
              PopupMenuItem(child: Text('All'), value: 'all'),
              PopupMenuItem(child: Text('Done'), value: 'done'),
              PopupMenuItem(child: Text('Undone'), value: 'undone'),
            ],
            initialValue: 'all',
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: IconButton(
              tooltip: 'Add Todo',
              icon: Icon(
                Icons.add_circle_rounded, 
                size: 50, 
              ),
              onPressed: () async {
                var newTodo = await Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => AddTodoView(
                      TodoRow(todoText: ''),
                    ),
                  ),
                );
                  if (newTodo != null) {
                    Provider.of<MyState>(context, listen: false).addTodo(newTodo);
                  }
              },
            ),
          ),
        ],
      ),
      body: Consumer<MyState>(
        builder: (context, state, child) => 
          TodoList(
            _filterTodos(state.list, state.filterBy),  
          ),
      ),
    );
  }

  List<TodoRow> _filterTodos(list, filterBy) {
    if (filterBy == 'all') 
      return list;
    if (filterBy == 'done')
      return list.where((item) => item.completed == true).toList();
    if (filterBy == 'undone')
      return list.where((item) => item.completed == false).toList();
    return null;
  }
}