
import 'package:flutter_demo/data_layer/model/todo.dart';

abstract class HomeState{}

class HomeInitial extends HomeState{}

class HomeLoaded extends HomeState{
  List<ToDo> todos;
  HomeLoaded({required this.todos});
}




