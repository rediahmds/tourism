import 'package:flutter/material.dart';
import 'package:tourism/screens/home/home_screen.dart';
import 'package:tourism/screens/bookmarks/bookmark_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _bottomNavBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: switch (_bottomNavBarIndex) {
        0 => HomeScreen(),
        _ => BookmarkScreen()
      },
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
            tooltip: "Home",
            activeIcon: Icon(
              Icons.home_filled,
              color: Colors.deepPurpleAccent,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmarks_rounded),
            label: "Bookmarks",
            tooltip: "Bookmarks",
            activeIcon: Icon(
              Icons.bookmarks_rounded,
              color: Colors.deepPurpleAccent,
            ),
          )
        ],
        currentIndex: _bottomNavBarIndex,
        onTap: (index) {
          setState(() {
            _bottomNavBarIndex = index;
          });
        },
      ),
    );
  }
}
