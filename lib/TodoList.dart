import 'package:TodoApp/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class TodoList extends StatelessWidget {
  final List<TodoRow> todoList;
  
  TodoList(this.todoList);

  @override
  Widget build(BuildContext context) {
    return ListView(children: todoList.map((todoRow)=> _todoRow(context, todoRow)).toList());
  }

  Widget _todoRow(context, TodoRow todoRow) { 
    return ListTile(
      leading: Checkbox(
          value: false, 
          onChanged: (bool newValue) {
            var state = Provider.of<MyState>(context, listen: false); // när jag får in Consumern i main så används detta
          },
          activeColor: Colors.black,
          ),
        title: Expanded(
          child : Text(todoRow.todoText, style: TextStyle(fontSize: 20)
          ),
        ),
        trailing: Container(
          child: IconButton(
            icon: Icon(Icons.close),
            tooltip: 'Delete', 
            onPressed: () {},
          ),
        ),  
    );
  }
  
}