import 'package:TodoApp/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'AddTodoView.dart';
import 'TodoList.dart';

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
                      TodoRow(todoText: '' ),
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
    // Hur får jag denna(_image, widget-kod ligger längst ned här), som jag haft tidigare att dyka upp i bodyn, som jag hade som kod tidigare? Behöver lägga den i bodyn, men vet inte
    //hur jag kombinerar det med Consumern i detta fallet. Tror jag blivit lite blind här - så tar gärna emot tips (ej viktigt).
    /* body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _image(),
          ],
        ),
      ),*/
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

/*
  Widget _image() {
    return Stack( 
      children: [
        Image(image: AssetImage('assets/images/balkong1.jpg')),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(0, 255, 255, 255),
                  Color.fromARGB(255, 255, 255, 255),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
              )
            ),
          ),
        ),
        Positioned(
          bottom: 15,
          left: 21,
          child: Text('TEXT', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
        ),
      ],
    );
  }
*/
}