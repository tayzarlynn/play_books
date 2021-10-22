import 'package:play_books/data/vos/book_search_result.dart';
import 'package:play_books/data/vos/book_vo.dart';
import 'package:play_books/data/vos/books_list_vo.dart';
import 'package:play_books/network/data_agent/ebooks_data_agent.dart';

import '../../mock_data/mock_data.dart';

class EbooksDataAgentImplMock extends EbooksDataAgent {
  @override
  Future<List<BooksListVO>?>? getEbooksList(String date) {
    return Future.value(getEbooksListMock());
  }

  @override
  Future<List<BookVO>?>? getEbooksListByList(String listNameEncode) {
    return Future.value(getEBooksMock());
  }

  @override
  Future<List<BookSearchResult?>?>? getBookSearch(String queryValue) {
    return Future.value(getBookSearchMock());
  }
}
