import 'package:json_annotation/json_annotation.dart';
import 'package:play_books/data/vos/ebooks_result_by_name_vo.dart';

part 'books_list_by_name_response.g.dart';

@JsonSerializable()
class BooksListByNameResponse{
  @JsonKey(name: 'results')
  EbooksResultByNameVO? results;

  BooksListByNameResponse(this.results);

  factory BooksListByNameResponse.fromJson(Map<String, dynamic> json) => _$BooksListByNameResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BooksListByNameResponseToJson(this);


}