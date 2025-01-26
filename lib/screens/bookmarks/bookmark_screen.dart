import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism/models/tourism.dart';
import 'package:tourism/provider/detail/bookmark_list.dart';
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
      body: Consumer<BookmarkListProvider>(
        builder: (context, value, child) {
          final bookmarkList = value.bookmarkList;
          return switch (bookmarkList.isNotEmpty) {
            true => ListView.builder(
                itemBuilder: (context, index) {
                  final tourism = bookmarkList[index];
                  return TourismCard(
                      tourism: tourism,
                      onTap: () {
                        Navigator.pushNamed(
                            context, NavigationRoute.detailRoute.name,
                            arguments: tourism);
                      });
                },
                itemCount: bookmarkList.length,
              ),
            _ => const Center(
                child: Text("Nothing on bookmark list"),
              )
          };
        },
      ),
    );
  }
}
