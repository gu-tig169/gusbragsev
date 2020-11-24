import 'package:TodoApp/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class TodoList extends StatelessWidget {
  final List<TodoRow> list;
  
  TodoList(this.list);

  @override
  Widget build(BuildContext context) {
    return ListView(children: list.map((todoRow)=> _todoRow(context, todoRow)).toList());
  }

  Widget _todoRow(context, todoRow) { 
    return ListTile(
      leading: Checkbox(
          value: todoRow.completed, 
          onChanged: (bool done) 
          {
            var state = Provider.of<MyState>(context, listen: false); // när jag får in Consumern i main så används detta
            state.changeTodo(todoRow);

          },
          activeColor: Colors.black,

          ),
        title: Expanded(
          child : Text(todoRow.todoText, style: TextStyle(fontSize: 20), 
          ),
        ),
        trailing: Container(
          child: IconButton(
            icon: Icon(Icons.close),
            tooltip: 'Delete', 
            onPressed: () {
              var state = Provider.of<MyState>(context, listen: false);
              state.removeTodo(todoRow);
            },
          ),
        ),  
    );
  }
  
}