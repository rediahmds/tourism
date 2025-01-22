import 'package:flutter/material.dart';
import 'package:tourism/models/tourism.dart';
import 'package:tourism/screens/home/tourism_card.dart';
import 'package:tourism/static/navigation_route.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tourism Bookmarks"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final tourism = bookmarkedTourismList[index];
          return TourismCard(
              tourism: tourism,
              onTap: () {
                Navigator.pushNamed(context, NavigationRoute.detailRoute.name,
                    arguments: tourism);
              });
        },
        itemCount: bookmarkedTourismList.length,
      ),
    );
  }
}
