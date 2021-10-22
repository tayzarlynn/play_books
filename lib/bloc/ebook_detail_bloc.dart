import 'package:flutter/foundation.dart';
import 'package:play_books/data/model/ebooks_model.dart';
import 'package:play_books/data/model/ebooks_model_impl.dart';
import 'package:play_books/data/vos/book_vo.dart';

class EbookDetailBloc extends ChangeNotifier {
  EbooksModel _model = EbooksModelImpl();

  ///state
  BookVO? book;

  EbookDetailBloc(String primaryIsbn10,[EbooksModel? ebooksModelMock]) {
    ///for unit testing
    if(ebooksModelMock!=null) _model = ebooksModelMock;


    book = _model.getBookDetail(primaryIsbn10);
    notifyListeners();

    _model.saveBookToLibrary(book!.title.toString(), book!);
  }
}
