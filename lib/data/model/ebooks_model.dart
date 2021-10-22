import 'package:play_books/data/vos/book_search_result.dart';
import 'package:play_books/data/vos/book_vo.dart';
import 'package:play_books/data/vos/books_list_vo.dart';
import 'package:play_books/data/vos/shelf_vo.dart';

abstract class EbooksModel {
  ///for ebook page
  void getEbooksList(String date);
  Stream<List<BooksListVO>?> getEbooksListFromDataBase(String date);

  ///for ebook list by listNameEncode
  void getEbooksListByName(String listNameEncode);
  Stream<List<BookVO>> getEbooksListByNameFromDataBase(String listNameEncode);

  ///for ebook search
  getBookSearch(String queryValue);
  Stream<List<BookVO>> getBookSearchFromDataBase(String queryValue);

  ///for ebook detail
  BookVO? getBookDetail(String title);

  ///for library
  void saveBookToLibrary(String name, BookVO bookVO);
  Future deleteBookFromLibrary(String title);
  BookVO? getBookFromLibrary(String title);
  Stream<List<BookVO>> getLibraryEbooksFromDatabaseWithTitle();
  Stream<List<BookVO>> getLibraryEbooksFromDatabaseWithAuthor();

  ///for shelf
  Future createShelf(String uniqueID, ShelfVO shelf);
  Future updateShelf(String uniqueID, String name);
  ShelfVO? getShelf(String uniqueID);
  void deleteShelf(String uniqueID);
  Future addBookToShelf(BookVO book, String uniqueID);
  Stream<List<ShelfVO>> getAllShelf();

  ///for shelf books
  Stream<List<BookVO>> getShelfEbooksFromDatabaseWithTitle(String uniqueID);
  Stream<List<BookVO>> getShelfEbooksFromDatabaseWithAuthor(String uniqueID);
}
