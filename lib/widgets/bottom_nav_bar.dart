import 'package:flutter/material.dart';
import 'package:vst_app/screens/discover_screen.dart';
import 'package:vst_app/screens/home_screen.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      items: [
        BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () =>
                  {Navigator.pushNamed(context, HomeScreen.routeName)},
              icon: const Icon(Icons.home),
            ),
            label: 'Accueil'),
        BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () =>
                  {Navigator.pushNamed(context, DiscoverScreen.routeName)},
              icon: const Icon(Icons.search),
            ),
            label: 'Découvrir'),
        BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () => {print('No profile screen yet')},
              icon: const Icon(Icons.person),
            ),
            label: 'Profil')
      ],
    );
  }
}
