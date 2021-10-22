import 'package:dio/dio.dart';
import 'package:play_books/network/api_const.dart';
import 'package:play_books/network/responses/books_list_by_name_response.dart';
import 'package:play_books/network/responses/books_list_response.dart';
import 'package:retrofit/http.dart';

part 'ebooks_api.g.dart';

@RestApi(baseUrl: EBOOK_BASE_URL)
abstract class EbooksAPI {
  factory EbooksAPI(Dio dio) = _EbooksAPI;

  ///get  title and ebook list
  @GET(GET_EBOOKS_END_POINT)
  Future<BooksListResponse> getEbooksList(
    @Query(PARAM_API_KEY) String apiKey,
    @Query(PARAM_PUBLISHED_DATE) String date,
  );

  ///get ebooks with list
  @GET('$GET_EBOOKS_LIST_END_POINT/{listNameEncoded}.json')
  Future<BooksListByNameResponse> getEbooksListByList(
    @Path('listNameEncoded') String listNameEncoded,
    @Query(PARAM_API_KEY) String apiKey,
  );



}
