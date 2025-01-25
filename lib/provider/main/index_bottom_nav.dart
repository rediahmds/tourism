import 'package:flutter/widgets.dart';

class IndexBottomNavProvider extends ChangeNotifier {
  int _indexBottomNavbar = 0;

  int get indexBottomNavbar => _indexBottomNavbar;

  set setIndexBottomNavbar(int newIndex) {
    _indexBottomNavbar = newIndex;
    notifyListeners();
  }
}