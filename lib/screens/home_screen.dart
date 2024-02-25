import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () => {},
                icon: const Icon(Icons.home),
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () => {},
                icon: const Icon(Icons.search),
              ),
              label: 'Search'),
          BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () => {},
                icon: const Icon(Icons.person),
              ),
              label: 'Profil')
        ],
      ),
      body: Container(),
    );
  }
}
