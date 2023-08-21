import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/presentation_layer/dashboard/dashboard_cubit.dart';
import '../../data_layer/model/todo.dart';
import 'dashboard_states.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          if (state is DashboardInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is DashboardLoaded) {
            return LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              double maxWidth = constraints.maxWidth;
              int crossAxisCount = maxWidth ~/ 250;
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  childAspectRatio: 3 / 2,
                ),
                itemCount: state.todos.length,
                itemBuilder: ((context, index) {
                  ToDo todo = state.todos[index];
                  return Card(
                    child: Text(todo.title),
                  );
                }),
              );
            });
          }
          return Container();
        },
      );
  }
}
