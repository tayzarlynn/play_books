import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:play_books/data/model/ebooks_model.dart';
import 'package:play_books/data/model/ebooks_model_impl.dart';
import 'package:play_books/data/vos/shelf_vo.dart';

class YourShelvesViewBloc extends ChangeNotifier {
  ///model
  EbooksModel _model = EbooksModelImpl();
  List<ShelfVO>? shelfList;

  YourShelvesViewBloc([EbooksModel? ebooksModelMock]) {
    ///for unit testing
    if (ebooksModelMock != null) _model = ebooksModelMock;

    _model.getAllShelf().listen((event) {
      shelfList = event;
      notifyListeners();
    });
  }
}
