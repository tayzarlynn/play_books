import 'package:dio/dio.dart';
import 'package:play_books/data/vos/book_search_result.dart';
import 'package:play_books/data/vos/book_vo.dart';
import 'package:play_books/data/vos/books_list_vo.dart';
import 'package:play_books/network/api/ebook_search_api.dart';
import 'package:play_books/network/api/ebooks_api.dart';
import 'package:play_books/network/api_const.dart';
import 'package:play_books/network/data_agent/ebooks_data_agent.dart';

class EbooksDataAgentImpl extends EbooksDataAgent {
  ///Ebook api
  EbooksAPI? _api;
  EbookSearchAPI? _apiSearch;


  static final EbooksDataAgentImpl singleton = EbooksDataAgentImpl._internal();

  factory EbooksDataAgentImpl() {
    return singleton;
  }

  EbooksDataAgentImpl._internal(){
    final Dio dio = Dio();
    _api = EbooksAPI(dio);
    _apiSearch = EbookSearchAPI(dio);
  }

  @override
  Future<List<BooksListVO>?>? getEbooksList(String date) {
  return  _api?.getEbooksList(API_KEY, date)
      .asStream()
      .map((response) => response.results?.lists)
      .first;

  }

  @override
  Future<List<BookVO>?>? getEbooksListByList(String listNameEncode) {
   return _api?.getEbooksListByList(listNameEncode,API_KEY)
       .asStream()
       .map((response) => response.results?.books)
       .first;
  }

  @override
  Future<List<BookSearchResult?>?>? getBookSearch(String queryValue) {
    return _apiSearch?.getBookSearch(queryValue)
        .asStream()
        .map((response) => response.items)
        .first;
  }
}
