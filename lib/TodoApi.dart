import 'package:TodoApp/model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

const API_URL = 'https://todoapp-api-vldfm.ondigitalocean.app';
const API_KEY = '2f9581ba-3c47-454e-b37b-19c06ac46ef7';

class TodoApi {

  static Future addTodo(TodoRow todoRow) async {
    Map<String, dynamic> json = TodoRow.toJson(todoRow);
    var bodyString = jsonEncode(json);

    await http.post(
      '$API_URL/todos?key=$API_KEY',
      body : bodyString,
      headers: {'Content-Type': 'application/json'},
    );
  }

  
  static Future <List<TodoRow>> getTodos() async {
    var response = await http.get(
      '$API_URL/todos?key=$API_KEY'
    );
    String bodyString = response.body;
    print(response.body);
    var json = jsonDecode(bodyString);
    
    return json.map<TodoRow>((data) {
      return TodoRow.fromJson(data);
    }).toList();
  }

  static Future deleteTodo(String id) async {
    await http.delete('$API_URL/todos/$id?key=$API_KEY');
  }

  static Future updateTodoCheckvalue(TodoRow todoRow) async {
    var json = jsonEncode(TodoRow.toJson(todoRow));
    String id = todoRow.id;
    await http.put(
      '$API_URL/todos/$id?key=$API_KEY',
      body: json,
      headers: {'Content-Type': 'application/json'}
    );
  }
}



