import 'package:hive/hive.dart';
import 'package:play_books/data/vos/books_list_vo.dart';
import 'package:play_books/persistence/dao/book_list_dao.dart';

import '../../constant.dart';

class BooksListDAOImpl extends BooksListDAO{
  static final BooksListDAOImpl _singleton = BooksListDAOImpl._internal();

  factory BooksListDAOImpl() {
    return _singleton;
  }

  BooksListDAOImpl._internal();

  void saveAllBooksList(List<BooksListVO>? booksList) async {
    Map<String, BooksListVO> booksListMap = Map.fromIterable(
      booksList!,
      key: (bookList) => bookList.listName,
      value: (booksList) => booksList,
    );
    await _getBox().putAll(booksListMap);
  }

  List<BooksListVO>? getAllBookList() {
    if (_getBox().isNotEmpty) {
      return _getBox().values.toList();
    } else {
      return [];
    }
  }

  ///reactive
  Stream<void> getAllBooksListEventStream() {
    return _getBox().watch();
  }

  Stream<List<BooksListVO>?> getAllBookListStream() {
    return Stream.value(getAllBookList());
  }

  Box<BooksListVO> _getBox() {
    return Hive.box<BooksListVO>(BOOKS_LIST_BOX_NAME);
  }
}
