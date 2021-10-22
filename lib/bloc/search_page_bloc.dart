import 'package:flutter/foundation.dart';
import 'package:play_books/data/model/ebooks_model.dart';
import 'package:play_books/data/model/ebooks_model_impl.dart';
import 'package:play_books/data/vos/book_vo.dart';

class SearchPageBloc extends ChangeNotifier {
  ///model
  EbooksModel _model = EbooksModelImpl();

  ///state
  bool isSearch = false;
  List<BookVO>? books;

  ///for unit testing
  SearchPageBloc([EbooksModel? ebooksModelMock]) {
    if (ebooksModelMock != null) _model = ebooksModelMock;
  }

  onSubmittedFunction(String queryText) {
    isSearch = true;
    notifyListeners();

    _model.getBookSearchFromDataBase(queryText).listen((value) {
      books = value;
      notifyListeners();
    });
  }
}
