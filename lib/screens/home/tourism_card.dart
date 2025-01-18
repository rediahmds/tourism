import 'package:flutter/material.dart';
import 'package:tourism/models/tourism.dart';
import 'cover_image.dart';
import 'cover_location.dart';
import 'cover_likes.dart';

class TourismCard extends StatelessWidget {
  const TourismCard({super.key, required this.tourism, required this.onTap});

  final Tourism tourism;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CoverImage(url: tourism.image),
            const SizedBox.square(dimension: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    tourism.name,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox.square(dimension: 6),
                  CoverLocation(address: tourism.address),
                  const SizedBox.square(dimension: 6),
                  CoverLikes(likes: tourism.like),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
