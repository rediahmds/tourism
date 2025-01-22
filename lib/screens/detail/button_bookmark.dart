import 'package:flutter/material.dart';
import 'package:tourism/models/tourism.dart';

class ButtonBookmark extends StatefulWidget {
  const ButtonBookmark({super.key, required this.tourism});

  final Tourism tourism;

  @override
  State<ButtonBookmark> createState() => _ButtonBookmarkState();
}

class _ButtonBookmarkState extends State<ButtonBookmark> {
  late bool _isBookmarked;

  @override
  void initState() {
    final currentTourism = bookmarkedTourismList
        .where((current) => current.id == widget.tourism.id);

    // if current tourism is in bookmarked list, light up the bookmark icon
    setState(() {
      if (currentTourism.isNotEmpty) {
        _isBookmarked = true;
      } else {
        _isBookmarked = false;
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(_addBookmark);
      },
      icon: Icon(_isBookmarked
          ? Icons.bookmark_rounded
          : Icons.bookmark_outline_outlined),
      color: _isBookmarked ? Colors.deepPurpleAccent : Colors.grey,
    );
  }

  void _addBookmark() {
    if (!_isBookmarked) {
      // if havent bookmarked, add ontap
      bookmarkedTourismList.add(widget.tourism);
    } else {
      // if already bookmarked, remove ontap
      bookmarkedTourismList
          .removeWhere((current) => widget.tourism.id == current.id);
    }
    _isBookmarked = !_isBookmarked;
  }
}
