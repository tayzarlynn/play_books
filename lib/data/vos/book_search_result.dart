import 'package:json_annotation/json_annotation.dart';
import 'book_vo.dart';

part 'book_search_result.g.dart';

@JsonSerializable()
class BookSearchResult{

  @JsonKey(name: 'volumeInfo')
  BookVO? volumeInfo;

  BookSearchResult(this.volumeInfo);

  factory BookSearchResult.fromJson(Map<String, dynamic> json) => _$BookSearchResultFromJson(json);
  Map<String, dynamic> toJson() => _$BookSearchResultToJson(this);
}