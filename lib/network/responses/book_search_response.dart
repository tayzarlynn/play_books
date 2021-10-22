import 'package:json_annotation/json_annotation.dart';
import 'package:play_books/data/vos/book_search_result.dart';

part 'book_search_response.g.dart';


@JsonSerializable()
class BookSearchResponse{
  @JsonKey(name: 'items')
  List<BookSearchResult?>? items;

  BookSearchResponse(this.items);

  factory BookSearchResponse.fromJson(Map<String, dynamic> json) => _$BookSearchResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BookSearchResponseToJson(this);
}