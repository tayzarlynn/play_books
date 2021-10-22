import 'package:play_books/data/vos/book_vo.dart';

abstract class BookDAO{
  void saveAllBooksFromNetwork(List<BookVO?> books);
  List<BookVO> getAllBooks();
  BookVO? getBook(String title);
  List<BookVO> getBookListByListNameFromDataBase(String listNameEncode);
  Stream<List<BookVO>> getBookListByListNameFromDataBaseStream(
      String listNameEncode);
  List<BookVO> getBookSearchFromDataBase(String queryValue);
  Stream<List<BookVO>> getBookSearchFromDataBaseStream(String queryValue);
  Stream<void> getAllBooksEventStream();

}