import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:play_books/data/model/ebooks_model.dart';
import 'package:play_books/data/model/ebooks_model_impl.dart';
import 'package:play_books/data/vos/book_vo.dart';
import 'package:play_books/data/vos/shelf_vo.dart';

class AddToShelfBloc extends ChangeNotifier {
  List<ShelfVO>? shelfList;
  BookVO? book;

  ///model
  EbooksModel _model = EbooksModelImpl();


  AddToShelfBloc(BookVO book,[EbooksModel? ebooksModelMock]) {
    if(ebooksModelMock != null) _model = ebooksModelMock;
    this.book = book;
    _model.getAllShelf().listen((event) {
      shelfList = event;
      notifyListeners();
    });
  }
 Future addBookToShelf(BuildContext context, String uniqueID) {
    return  _model.addBookToShelf(this.book!, uniqueID);
  }
}
