import 'package:play_books/data/vos/book_vo.dart';

abstract class LibraryBookDAO{
  void saveBookToLibrary(String name, BookVO bookVO);
  Future deleteBookFromLibrary(String title);
  BookVO? getBook(String title);
  List<BookVO> getAllBooksFromLibraryWithTitle();
  List<BookVO> getAllBooksFromLibraryWithAuthor();
  Stream<void> getAllLibraryBooksEvent();
  Stream<List<BookVO>> getAllLibraryBooksWithTitleStream();
  Stream<List<BookVO>> getAllLibraryBooksWithAuthorStream();
}