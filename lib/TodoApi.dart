import 'package:TodoApp/model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

const API_URL = 'https://todoapp-api-vldfm.ondigitalocean.app';
const API_KEY = '03c93d5b-1ac3-47fb-9ad2-266dc899fbb7';

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
}

 //Ej klart: Skapa något som kan uppdatera TodoRow i förhållande till 'done'
 //så att filter fungerar) - PUT
 //Fungerar just nu i UI:t - men uppdaterar INTE API:et, så varje gång man lägger till en ny Todo så försvinner statet


