import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:play_books/data/model/ebooks_model.dart';
import 'package:play_books/data/model/ebooks_model_impl.dart';
import 'package:play_books/data/vos/book_vo.dart';
import 'package:play_books/data/vos/shelf_vo.dart';
import 'package:play_books/utils/modal_and_dialog.dart';
import 'package:play_books/view/pages/create_new_shelf_page.dart';
import 'package:play_books/view/resources/constant.dart';

import '../main.dart';

class ShelfDetailBloc extends ChangeNotifier {
  ///for tap count
  int index = 0;

  EbooksModel _model = EbooksModelImpl();
  String? uniqueID;

  ///state
  ShelfVO? shelf;
  List<BookVO>? books;
  RadioText radioGroupValue = RadioText.Title;
  LayoutText layoutText = LayoutText.ThreeGrid;

  ShelfDetailBloc(String uniqueID, [EbooksModel? ebooksModelMock]) {
    ///for unit testing
    if (ebooksModelMock != null) _model = ebooksModelMock;

    this.uniqueID = uniqueID;
    shelf = _model.getShelf(uniqueID);
    notifyListeners();

    getShelfEbookFromDatabaseWithTitle(uniqueID);
  }

  void getShelfEbookFromDatabaseWithTitle(String uniqueID) {
    _model.getShelfEbooksFromDatabaseWithTitle(uniqueID).listen((event) {
      books = event;
      notifyListeners();
    });
  }

  void getShelfEbookFromDatabaseWithAuthor(String uniqueID) {
    _model.getShelfEbooksFromDatabaseWithAuthor(uniqueID).listen((event) {
      books = event;
      notifyListeners();
    });
  }

  void popupMenuSelectedFunction(
      BuildContext context, PopupMenuShelf selectedMenu) {
    switch (selectedMenu) {
      case PopupMenuShelf.RenameShelf:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CreateNewShelfPage(uniqueID: uniqueID),
          ),
        );
        break;
      case PopupMenuShelf.DeleteShelf:
        ModalAndDialog.showCustomDialog(
          context,
          () {
            _model.deleteShelf(uniqueID!);
            Navigator.of(context, rootNavigator: true).pop();
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => MyApp(
                  index: 1,
                ),
              ),
              (e) => false,
            );
          },
        );
        break;
    }
  }

  ///tap on Sort by button
  void showSortByBottomSheet(BuildContext context) {
    ModalAndDialog.sortByRadioBottomSheet(context, radioGroupValue, (value) {
      radioGroupValue = value;
      notifyListeners();
      Navigator.pop(context);
    });
  }

  /// tap on layout change icon
  void changeLayoutView(BuildContext context) {
    index++;
    if (index > 2) {
      index = 0;
    }
    layoutText = LayoutText.values[index];
    notifyListeners();
  }
}
