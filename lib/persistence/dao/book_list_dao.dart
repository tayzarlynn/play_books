import 'package:play_books/data/vos/books_list_vo.dart';

abstract class BooksListDAO{
  void saveAllBooksList(List<BooksListVO>? booksList);
  List<BooksListVO>? getAllBookList();
  Stream<void> getAllBooksListEventStream();
  Stream<List<BooksListVO>?> getAllBookListStream();

}