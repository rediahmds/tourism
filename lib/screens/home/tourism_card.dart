import 'package:flutter/material.dart';
import 'package:tourism/models/tourism.dart';

class TourismCard extends StatelessWidget {
  const TourismCard({super.key, required this.tourism});

  final Tourism tourism;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _goToDetail(context, tourism),
      child: Card.outlined(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                tourism.name,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                tourism.description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureTapCallback _goToDetail(BuildContext context, Tourism tourism) {
    // TODO: Implement switching pages
    debugPrint("[DEBUG] Switching page to /detail");
    return () {
      Navigator.pushNamed(context, "/detail", arguments: tourism);
    };
  }
}
