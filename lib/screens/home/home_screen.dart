import 'package:flutter/material.dart';
import 'tourism_card.dart';
import 'package:tourism/data/models/tourism.dart';
import 'package:tourism/static/navigation_route.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tourism List"),
      ),
      body: ListView.builder(
        itemCount: tourismList.length,
        itemBuilder: (context, index) {
          final tourism = tourismList[index];

          return TourismCard(
              tourism: tourism,
              onTap: () {
                Navigator.pushNamed(context, NavigationRoute.detailRoute.name,
                    arguments: tourism);
              });
        },
      ),
    );
  }
}
