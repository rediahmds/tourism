import 'package:flutter/widgets.dart';
import 'package:tourism/data/models/tourism.dart';

class BookmarkListProvider extends ChangeNotifier {
  final List<Tourism> _bookmarkList = [];

  List<Tourism> get bookmarkList => _bookmarkList;

  void addBookmark(Tourism tourism) {
    _bookmarkList.add(tourism);
    notifyListeners();
  }

  void removeBookmark(Tourism tourism) {
    _bookmarkList.removeWhere((bookmarked) => bookmarked.id == tourism.id);
    notifyListeners();
  }

  bool isBookmarked(Tourism tourism) {
    final bookmarkedList = _bookmarkList.where((bookmarked) => bookmarked.id == tourism.id);
    return bookmarkedList.isNotEmpty;
  }
}