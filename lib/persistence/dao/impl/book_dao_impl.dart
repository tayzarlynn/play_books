import 'package:hive/hive.dart';
import 'package:play_books/data/vos/book_vo.dart';
import 'package:play_books/persistence/constant.dart';
import 'package:play_books/persistence/dao/book_dao.dart';

class BookDAOImpl extends BookDAO{
  static final BookDAOImpl _singleton = BookDAOImpl._internal();

  factory BookDAOImpl() {
    return _singleton;
  }

  BookDAOImpl._internal();

  void saveAllBooksFromNetwork(List<BookVO?> books) async {
    Map<String, BookVO> booksMap = Map.fromIterable(
      books,
      key: (book) => book.title,
      value: (book) => book,
    );
    await _getBox().putAll(booksMap);
  }

  List<BookVO> getAllBooks() {
    if (_getBox().isNotEmpty) {
      return _getBox().values.toList();
    } else {
      return [];
    }
  }

  BookVO? getBook(String title) {
    return _getBox().get(title);
  }

  ///for ebook list by listNameEncode
  List<BookVO> getBookListByListNameFromDataBase(String listNameEncode) {
    if (_getBox().isNotEmpty) {
      return getAllBooks()
          .where((element) => element.listNameEncode == listNameEncode)
          .toList();
    } else {
      return [];
    }
  }

  Stream<List<BookVO>> getBookListByListNameFromDataBaseStream(
      String listNameEncode) {
    return Stream.value(getBookListByListNameFromDataBase(listNameEncode));
  }

  ///for search
  List<BookVO> getBookSearchFromDataBase(String queryValue) {
    if (_getBox().isNotEmpty) {
      return getAllBooks()
          .where((element) => element.queryValue == queryValue)
          .toList();
    } else {
      return [];
    }
  }

  Stream<List<BookVO>> getBookSearchFromDataBaseStream(String queryValue) {
    return Stream.value(getBookSearchFromDataBase(queryValue));
  }

  ///reactive
  Stream<void> getAllBooksEventStream() {
    return _getBox().watch();
  }

  Box<BookVO> _getBox() {
    return Hive.box<BookVO>(BOOK_VO_BOX_NAME);
  }
}
