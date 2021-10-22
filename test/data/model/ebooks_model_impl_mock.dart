import 'package:play_books/data/model/ebooks_model.dart';
import 'package:play_books/data/vos/book_vo.dart';
import 'package:play_books/data/vos/books_list_vo.dart';
import 'package:play_books/data/vos/shelf_vo.dart';

import '../../mock_data/mock_data.dart';

class EbooksModelImplMock extends EbooksModel {
  void getEbooksList(String date) {
    ///no need mock
  }
  Stream<List<BooksListVO>?> getEbooksListFromDataBase(String date) {
    return Stream.value(getEbooksListMock());
  }

  void getEbooksListByName(String listNameEncode) {
    ///no need mock
  }
  Stream<List<BookVO>> getEbooksListByNameFromDataBase(String listNameEncode) {
    return Stream.value(getEBooksMock());
  }

  getBookSearch(String queryValue) {
    ///no need mock
  }
  Stream<List<BookVO>> getBookSearchFromDataBase(String queryValue) {
    return Stream.value(getEBooksMock());
  }

  BookVO? getBookDetail(String title) {
    return getEBooksMock().first;
  }

  void saveBookToLibrary(String name, BookVO bookVO) {}
  Future deleteBookFromLibrary(String title) {
    return Future.value();
  }

  BookVO? getBookFromLibrary(String title) {}
  Stream<List<BookVO>> getLibraryEbooksFromDatabaseWithTitle() {
    return Stream.value(getEBooksMock());
  }

  Stream<List<BookVO>> getLibraryEbooksFromDatabaseWithAuthor() {
    return Stream.value(getEBooksMock());
  }

  ///nothing return
  Future createShelf(String uniqueID, ShelfVO shelf) {
    return Future.value();
  }

  ///nothing return
  Future updateShelf(String uniqueID, String name) {
    return Future.value();
  }

  ShelfVO? getShelf(String uniqueID) {
    return getShelfMock().first;
  }

  ///nothing return
  void deleteShelf(String uniqueID) {}
  Future addBookToShelf(BookVO book, String uniqueID) {
    return Future.value(getEBooksMock().first);
  }

  Stream<List<ShelfVO>> getAllShelf() {
    return Stream.value(getShelfMock());
  }

  Stream<List<BookVO>> getShelfEbooksFromDatabaseWithTitle(String uniqueID) {
    return Stream.value(getShelfMock().first.bookList ?? []);
  }

  Stream<List<BookVO>> getShelfEbooksFromDatabaseWithAuthor(String uniqueID) {
    return Stream.value(getShelfMock().first.bookList ?? []);
  }
}
