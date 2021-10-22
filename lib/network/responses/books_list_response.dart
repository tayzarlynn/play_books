import 'package:json_annotation/json_annotation.dart';
import 'package:play_books/data/vos/books_list_vo.dart';
import 'package:play_books/data/vos/ebooks_results_vo.dart';

part 'books_list_response.g.dart';

@JsonSerializable()
class BooksListResponse{

  @JsonKey(name: 'results')
  EbooksResultsVO? results;

  BooksListResponse(this.results);



  factory BooksListResponse.fromJson(Map<String, dynamic> json) =>
      _$BooksListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BooksListResponseToJson(this);
}