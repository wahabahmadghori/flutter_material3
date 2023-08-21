import 'package:flutter/material.dart';
import 'package:flutter_demo/presentation_layer/gallery/gallery_view.dart';
import 'package:flutter_demo/presentation_layer/settings/settings_view.dart';

import '../dashboard/dashboard_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<Widget> _body = [const DashboardView(), const GalleryView(), const SettingsView()];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(),
      body: _body[currentIndex],
      bottomNavigationBar: BottomAppBar(
        height: 100,
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.dashboard,
              ),
              label: 'Dashboard',
            ),
            
            BottomNavigationBarItem(
              icon: Icon(Icons.photo_album),
              label: 'Gallery',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Settings',
            ),
          ],
          currentIndex: 0,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
      floatingActionButton: const FloatingActionButton(onPressed: null),
    );
  }
}
