import 'package:dio/dio.dart';
import 'package:play_books/network/responses/book_search_response.dart';
import 'package:retrofit/http.dart';
import '../api_const.dart';

part 'ebook_search_api.g.dart';

@RestApi(baseUrl: EBOOK_SEARCH_BASE_URL)
abstract class EbookSearchAPI {
  factory EbookSearchAPI(Dio dio) = _EbookSearchAPI;

  @GET(GET_SEARCH_BOOK_END_POINT)
  Future<BookSearchResponse> getBookSearch(
    @Query(PARAM_Q) String queryValue,
  );
}
