import 'package:hive/hive.dart';
import 'package:play_books/data/vos/book_vo.dart';

import '../../constant.dart';
import '../library_book_dao.dart';

class LibraryBookDAOImpl extends LibraryBookDAO{
  static final LibraryBookDAOImpl _singleton = LibraryBookDAOImpl._internal();

  factory LibraryBookDAOImpl() {
    return _singleton;
  }

  LibraryBookDAOImpl._internal();

  void saveBookToLibrary(String name, BookVO bookVO) {
    _getBox().put(name, bookVO);
  }

  Future deleteBookFromLibrary(String title) {
    return _getBox().delete(title);
  }

  BookVO? getBook(String title) {
    return _getBox().get(title);
  }

  List<BookVO> getAllBooksFromLibraryWithTitle() {
    if (_getBox().isNotEmpty) {
      return _getBox().values.toList();
    } else {
      return [];
    }
  }

  List<BookVO> getAllBooksFromLibraryWithAuthor() {
    List<BookVO> books = _getBox().values.toList();
    if (_getBox().isNotEmpty) {
      books.sort((a, b) => a.author.toString().compareTo(b.author.toString()));
      return books;
    } else {
      return [];
    }
  }

  ///-------------------------------reactive-------------------------------///

  Stream<void> getAllLibraryBooksEvent() {
    return _getBox().watch();
  }

  Stream<List<BookVO>> getAllLibraryBooksWithTitleStream() {
    return Stream.value(getAllBooksFromLibraryWithTitle());
  }

  Stream<List<BookVO>> getAllLibraryBooksWithAuthorStream() {
    return Stream.value(getAllBooksFromLibraryWithAuthor());
  }

  Box<BookVO> _getBox() {
    return Hive.box<BookVO>(BOOK_VO_LIBRARY_BOX_NAME);
  }
}
