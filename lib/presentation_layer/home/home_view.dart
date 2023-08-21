import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/presentation_layer/home/home_cubit.dart';

import '../../data_layer/model/todo.dart';
import 'home_states.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeLoaded) {
            return LayoutBuilder(
              builder:(BuildContext context, BoxConstraints constraints){
                double maxWidth = constraints.maxWidth;
                int crossAxisCount = maxWidth ~/ 200;
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    childAspectRatio: 3/2,
                  ),
                  itemCount: state.todos.length,
                  itemBuilder: ((context, index) {
                    ToDo todo = state.todos[index];
                    return Card(
                      child: Text(todo.title),
                    );
                  }),
                );
              } );
          }
          return Container();
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        height: 100,
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.photo_album),
              label: 'Gallery',
            ),
          ],
          currentIndex: 0,
          onTap: (index) {
            // Do something when an item is tapped.
          },
        ),
      ),
      floatingActionButton: const FloatingActionButton(onPressed: null),
    );
  }
}
