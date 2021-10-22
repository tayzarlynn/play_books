import 'package:play_books/data/vos/books_list_vo.dart';
import 'package:play_books/persistence/dao/book_list_dao.dart';

import '../mock_data/mock_data.dart';

class BookListDAOImplMock extends BooksListDAO{
  Map<String?,BooksListVO> booksListFromMockDB ={};

  @override
  void saveAllBooksList(List<BooksListVO>? booksList) {
   booksList?.forEach((books) {
     booksListFromMockDB[books.listName] = books;
   });
  }


  @override
  List<BooksListVO>? getAllBookList() {
    return getEbooksListMock();
  }

  @override
  Stream<List<BooksListVO>?> getAllBookListStream() {
    return Stream.value(getEbooksListMock());
  }

  @override
  Stream<void> getAllBooksListEventStream() {
    return Stream<void>.value(null);
  }



}