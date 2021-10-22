import 'package:flutter/foundation.dart';
import 'package:play_books/data/model/ebooks_model.dart';
import 'package:play_books/data/model/ebooks_model_impl.dart';
import 'package:play_books/data/vos/book_vo.dart';

class AllEbooksPageBloc extends ChangeNotifier {
  ///model
  EbooksModel _model = EbooksModelImpl();

  ///ebook detail list
  List<BookVO>? books;

  AllEbooksPageBloc(String listNameEncoded,[EbooksModel? ebooksModelMock]) {
    ///for unit testing
    if(ebooksModelMock!=null) _model = ebooksModelMock;

    ///get all ebook by listNameEncoded
    _model.getEbooksListByNameFromDataBase(listNameEncoded).listen((response) {
      books = response;
      notifyListeners();
    });
  }
}
