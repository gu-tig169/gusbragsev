import 'package:TodoApp/model.dart';
import 'package:flutter/material.dart';

class AddTodoView extends StatefulWidget {
  final TodoRow todoRow;
  
  AddTodoView(this.todoRow);

  @override
  State<StatefulWidget> createState() {
    return AddTodoViewState(todoRow);
  }
}

class AddTodoViewState extends State <AddTodoView>{
  String todoText;

  TextEditingController textEditingController;

  AddTodoViewState(TodoRow todoRow) {
    this.todoText = todoRow.todoText;

    textEditingController = TextEditingController(text: todoRow.todoText);

    textEditingController.addListener(() {
      setState(() {
        todoText = textEditingController.text;
        
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        title: Text('Add Todo'),
        backgroundColor: Colors.green[200],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(height: 50),
            _todoField(),
            Container(height: 20,),
            _addTodo(),
          ],
        )
      )
    );
  }

  Widget _todoField() {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30),
      child: TextField(
          controller: textEditingController,
          decoration: InputDecoration(
          hintText: 'Vad behöver göras?', 
          fillColor: Colors.blue,
          border: OutlineInputBorder(),
          
        ),
      ),
    );
  }

  Widget _addTodo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RaisedButton(
          onPressed: () {
            Navigator.pop(
              context,
              TodoRow(todoText: todoText)
            );
          },
          child: 
            Text('Lägg till'),
            color: Colors.green[300],
        ),
      ],
    );
  } 
}