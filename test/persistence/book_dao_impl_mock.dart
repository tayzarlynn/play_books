import 'package:play_books/data/vos/book_vo.dart';
import 'package:play_books/persistence/dao/book_dao.dart';

import '../mock_data/mock_data.dart';

class BookDAOImplMock extends BookDAO{
  Map<String?,BookVO?> booksFromMockDB ={};


  @override
  void saveAllBooksFromNetwork(List<BookVO?> books) {
    books.forEach((book) {
      booksFromMockDB[book?.title] = book;
    });
  }

  @override
  List<BookVO> getAllBooks() {
   return getEBooksMock();
  }

  @override
  BookVO? getBook(String title) {
    return getEBooksMock().first;
  }

  @override
  Stream<void> getAllBooksEventStream() {
    return Stream.value(null);
  }



  @override
  List<BookVO> getBookListByListNameFromDataBase(String listNameEncode) {
    return getAllBooks()
        .where((element) => element.listNameEncode == listNameEncode)
        .toList();
  }

  @override
  Stream<List<BookVO>> getBookListByListNameFromDataBaseStream(String listNameEncode) {
    return Stream.value(getAllBooks()
        .where((element) => element.listNameEncode == listNameEncode)
        .toList());
  }

  @override
  List<BookVO> getBookSearchFromDataBase(String queryValue) {
    return getAllBooks()
        .where((element) => element.queryValue == queryValue)
        .toList();
  }

  @override
  Stream<List<BookVO>> getBookSearchFromDataBaseStream(String queryValue) {
    return Stream.value(getBookSearchFromDataBase(queryValue));
  }




}