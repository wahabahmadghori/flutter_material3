import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data_layer/model/todo.dart';
import '../../data_layer/use_cases/todo_load_data.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    getToDos();
  }
  getToDos() async {
    List<ToDo> todos = await ToDoLoadData().get();
    emit(HomeLoaded(todos: todos));
  }
}
