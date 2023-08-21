
import 'package:flutter_demo/data_layer/model/todo.dart';

abstract class DashboardState{}

class DashboardInitial extends DashboardState{
  DashboardInitial();
}

class DashboardLoaded extends DashboardState{
  List<ToDo> todos;
  DashboardLoaded({required this.todos});
}




