import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism/models/tourism.dart';
import 'package:tourism/provider/detail/bookmark_icon.dart';
import 'package:tourism/provider/detail/bookmark_list.dart';

class ButtonBookmark extends StatefulWidget {
  const ButtonBookmark({super.key, required this.tourism});

  final Tourism tourism;

  @override
  State<ButtonBookmark> createState() => _ButtonBookmarkState();
}

class _ButtonBookmarkState extends State<ButtonBookmark> {

  @override
  void initState() {
    final bookmarkListProvider = context.read<BookmarkListProvider>();
    final bookmarkIconProvider = context.read<BookmarkIconProvider>();

    Future.microtask(() {
      final isBookmarked = bookmarkListProvider.isBookmarked(widget.tourism);
      bookmarkIconProvider.setBookmark = isBookmarked;
    });

    // final currentTourism = bookmarkedTourismList
    //     .where((current) => current.id == widget.tourism.id);
    //
    // // if current tourism is in bookmarked list, light up the bookmark icon
    // setState(() {
    //   if (currentTourism.isNotEmpty) {
    //     _isBookmarked = true;
    //   } else {
    //     _isBookmarked = false;
    //   }
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        final bookmarkListProvider = context.read<BookmarkListProvider>();
        final bookmarkIconProvider = context.read<BookmarkIconProvider>();
        final isBookmarked = bookmarkIconProvider.isBookmarked;

        if (!isBookmarked) {
          bookmarkListProvider.addBookmark(widget.tourism);
        } else {
          bookmarkListProvider.removeBookmark(widget.tourism);
        }

        bookmarkIconProvider.setBookmark = !isBookmarked;
      },
      icon: Icon(context.watch<BookmarkIconProvider>().isBookmarked
          ? Icons.bookmark_rounded
          : Icons.bookmark_outline_outlined),
      color: context.watch<BookmarkIconProvider>().isBookmarked
          ? Colors.deepPurpleAccent
          : Colors.grey,
    );
  }
}
