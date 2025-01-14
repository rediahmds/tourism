import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  const Description({super.key, required this.descriptionText});

  final String descriptionText;

  @override
  Widget build(BuildContext context) {
    return Text(descriptionText);
  }
}
