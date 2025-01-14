import 'package:flutter/material.dart';

class LocationInfo extends StatelessWidget {
  const LocationInfo({super.key, required this.name, required this.address});

  final String name;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
        Text(address)
      ],
    );
  }
}
