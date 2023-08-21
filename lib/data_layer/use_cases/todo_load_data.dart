import 'package:dio/dio.dart';
import '../model/todo.dart';
class ToDoLoadData{
Future<List<ToDo>> get() async {
  final client = Dio();
  String url = "https://jsonplaceholder.typicode.com/todos";
  try {
    final response = await client.get(url);
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;    
      List<ToDo> todos = data.map((item) => ToDo.fromJson(item)).toList();
      return todos;
    } else {
      throw Exception('Error fetching data from API');
    }
  } catch (error) {
    throw Exception(error);
  }
}
}