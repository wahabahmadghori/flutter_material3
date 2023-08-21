import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data_layer/model/todo.dart';
import '../../data_layer/use_cases/todo_load_data.dart';
import 'dashboard_states.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardInitial()) {
    getToDos();
  }
  getToDos() async {
    List<ToDo> todos = await ToDoLoadData().get();
    emit(DashboardLoaded(todos: todos));
  }
}
