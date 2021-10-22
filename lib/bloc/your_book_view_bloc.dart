import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:play_books/data/model/ebooks_model.dart';
import 'package:play_books/data/model/ebooks_model_impl.dart';
import 'package:play_books/data/vos/book_vo.dart';
import 'package:play_books/utils/modal_and_dialog.dart';
import 'package:play_books/view/resources/constant.dart';

class YourBookViewBloc extends ChangeNotifier {
  ///for tap count
  int index = 0;

  ///model
  EbooksModel _model = EbooksModelImpl();

  ///state
  List<BookVO>? books;
  RadioText radioGroupValue = RadioText.Title;
  LayoutText layoutText = LayoutText.ThreeGrid;

  YourBookViewBloc([EbooksModel? ebooksModelMock]) {
    if(ebooksModelMock !=null) _model = ebooksModelMock;


    ///get books from database
    _getLibraryEbooks();
  }

  ///get books from database sort by title
  void _getLibraryEbooks() {
    _model.getLibraryEbooksFromDatabaseWithTitle().listen((event) {
      books = event;
      notifyListeners();
    });
  }

  void getLibraryEbooksFromDatabaseWithAuthor() {
    _model.getLibraryEbooksFromDatabaseWithAuthor().listen((event) {
      books = event;
      notifyListeners();
    });
  }

  void getLibraryEbooksFromDatabaseWithTitle() {
    _getLibraryEbooks();
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
