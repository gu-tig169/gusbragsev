import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainView(),
    );
  }
}

class MainView extends StatelessWidget {
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
              onPressed: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => SecondView()));
              },
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _image(),
            _todoRow('Mät soffdelen'),
            _todoRow('Gör en tidplan'),
            _todoRow('Mysiga kuddar'),
            _todoRow('Krukor + växter'),
            _todoRow('Köp en/två mattor'),
            _todoRow('Måla det fula bordet'),
          ],
        ),
      ),
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


  Widget _todoRow(String task) { 
    return Row(
      children: [
        Checkbox(
          value: false, 
          onChanged: (val) {},
          activeColor: Colors.black,
          ),
        Text(task, style: TextStyle(fontSize: 20)),
        Container(
          padding: const EdgeInsets.only(right: 0.0),
          width: 100,
          child: IconButton(
            icon: Icon(Icons.close),
            tooltip: 'Delete', 
            onPressed: () {},
          ),
        ),  
      ],
    );
  }
}

class SecondView extends StatelessWidget {
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
            print('Adding button pressed');
          },
          child: 
            Text('Lägg till'),
            color: Colors.green[300],
        ),
      ],
    );
  }
}
