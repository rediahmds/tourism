import 'package:flutter/material.dart';
import 'package:tourism/models/tourism.dart';
import 'package:tourism/screens/detail/image_overview.dart';
import 'package:tourism/screens/detail/location_info.dart';
import 'package:tourism/screens/detail/likes.dart';
import 'package:tourism/screens/detail/description.dart';
import 'package:tourism/screens/detail/button_bookmark.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.tourism});

  final Tourism tourism;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        title: const Text("Tourism Detail"),
        centerTitle: true,
        actions: [ButtonBookmark(tourism: tourism)],
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
        child: Column(
          children: [
            ImageOverview(url: tourism.image),
            Container(
              padding: EdgeInsets.only(top: 15, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LocationInfo(name: tourism.name, address: tourism.address),
                  Likes(likes: tourism.like)
                ],
              ),
            ),
            Description(descriptionText: tourism.description)
          ],
        ),
      )),
    );
  }
}
