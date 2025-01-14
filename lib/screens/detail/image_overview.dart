import 'package:flutter/widgets.dart';

class ImageOverview extends StatelessWidget {
  ImageOverview({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Image.network(url),
    );
  }
}
