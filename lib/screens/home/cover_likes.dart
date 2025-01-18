import 'package:flutter/material.dart';

class CoverLikes extends StatelessWidget {
  const CoverLikes({
    super.key,
    required this.likes,
  });

  final int likes;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.thumb_up_rounded,
          color: Colors.deepPurpleAccent,
        ),
        const SizedBox.square(dimension: 3),
        Text(likes.toString())
      ],
    );
  }
}
