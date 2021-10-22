import 'package:play_books/data/vos/book_vo.dart';
import 'package:play_books/persistence/dao/library_book_dao.dart';

import '../mock_data/mock_data.dart';

class LibraryBooKDAOImplMock extends LibraryBookDAO{
  Map<String,BookVO> libraryBooksFromMockDB ={};

  @override
  void saveBookToLibrary(String name, BookVO book) {
    libraryBooksFromMockDB[name] = book;
  }

  @override
  Future deleteBookFromLibrary(String title) {
   return Future.value(libraryBooksFromMockDB.remove(title));
  }

  @override
  BookVO? getBook(String title) {
    return libraryBooksFromMockDB[title];
  }

  @override
  List<BookVO> getAllBooksFromLibraryWithTitle() {
    return getEBooksMock();
  }

  @override
  List<BookVO> getAllBooksFromLibraryWithAuthor() {
    return getAllBooksFromLibraryWithTitle();
  }



  @override
  Stream<void> getAllLibraryBooksEvent() {
    return Stream.value(null);
  }

  @override
  Stream<List<BookVO>> getAllLibraryBooksWithAuthorStream() {
    return Stream.value(getAllBooksFromLibraryWithTitle());
  }

  @override
  Stream<List<BookVO>> getAllLibraryBooksWithTitleStream() {
    return Stream.value(getAllBooksFromLibraryWithTitle());
  }





}