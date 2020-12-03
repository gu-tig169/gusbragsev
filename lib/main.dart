import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './model.dart';
import './TodoListView.dart';


void main() {
  var state = MyState();
  state.getList();
  runApp(
    ChangeNotifierProvider(
      create: (context) => state,
      child: MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoListView(),
    );
  }
}


