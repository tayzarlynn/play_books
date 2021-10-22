import 'package:play_books/data/vos/book_search_result.dart';
import 'package:play_books/data/vos/book_vo.dart';
import 'package:play_books/data/vos/books_list_vo.dart';

abstract class EbooksDataAgent{
  Future<List<BooksListVO>?>? getEbooksList(String date);
  Future<List<BookVO>?>? getEbooksListByList(String listNameEncode);
  Future<List<BookSearchResult?>?>? getBookSearch(String queryValue);

}