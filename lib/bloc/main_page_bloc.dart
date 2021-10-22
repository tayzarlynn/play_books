import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:play_books/view/pages/ebooks_page.dart';
import 'package:play_books/view/pages/library_page.dart';

class MainPageBloc extends ChangeNotifier {
  ///state
  int index = 0;
  List<Widget> widgetList = [];

  MainPageBloc(int bottomNavigationIndex) {
    this.index = bottomNavigationIndex;
    widgetList.addAll([
      EbooksPage(),
      LibraryPage(
        tabIndex: index,
      ),
    ]);
  }

  void onTapBottomNavigation(int index) {
    this.index = index;
    notifyListeners();
  }
}
