import 'package:flutter/material.dart';
import 'package:tourism/screens/home/home_screen.dart';
import 'package:tourism/screens/bookmarks/bookmark_screen.dart';
import 'package:provider/provider.dart';
import 'package:tourism/provider/main/index_bottom_nav.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<IndexBottomNavProvider>( // Listens to notifier and update the ui
          builder: (context, value, child) {
            return switch (value.indexBottomNavbar) {
              0 => HomeScreen(),
              _ => BookmarkScreen()
            };
          }
      ),
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
        currentIndex: context.watch<IndexBottomNavProvider>().indexBottomNavbar,
        onTap: (index) {
          context.read<IndexBottomNavProvider>().setIndexBottomNavbar = index;
        },
      ),
    );
  }
}
