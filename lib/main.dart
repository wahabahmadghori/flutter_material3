import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/presentation_layer/dashboard/dashboard_view.dart';
import 'package:flutter_demo/presentation_layer/home/home_view.dart';

import 'presentation_layer/dashboard/dashboard_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => DashboardCubit(),
        child: const HomeView(),
      ),
    );
  }
}
