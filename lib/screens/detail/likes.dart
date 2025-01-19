import 'package:flutter/material.dart';

class Likes extends StatelessWidget {
  const Likes({super.key, required this.likes});

  final int likes;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.thumb_up_rounded,
          color: Colors.deepPurpleAccent,
        ),
        Text(
          likes.toString(),
          style: Theme.of(context).textTheme.labelMedium,
        )
      ],
    );
  }
}
