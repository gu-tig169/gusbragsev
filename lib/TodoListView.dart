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
          IconButton(
            icon: Icon(
              Icons.filter_list_alt), 
            onPressed: (){
                print('Här ska det skapas filterval');
              },    
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: IconButton(
              tooltip: 'Add Todo',
              icon: Icon(
                Icons.add_circle_rounded, 
                size: 50, 
              ),
              onPressed: () async{
                var newTodo = await Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => AddTodoView(TodoRow(
                      todoText: '' 
                    ))));
                    if (newTodo != null) {
                      Provider.of<MyState>(context, listen: false).addTodo(newTodo);
                    }
              },
            ),
          ),
        ],
      ),
      body: Consumer<MyState>(
        builder: (context, state, child) => TodoList(state.list)),

    // Hur får jag in Center nu så att jag kan använda image-widgeten? Eller var använder jag den? Hittar inget som passar i 
    //Scaffold
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
          child: Text('Framtidsbalkong', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
        ),
      ],
    );
  }



}