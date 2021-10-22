import 'package:json_annotation/json_annotation.dart';
import 'package:play_books/data/vos/books_list_vo.dart';

part 'ebooks_results_vo.g.dart';

@JsonSerializable()
class EbooksResultsVO{

  @JsonKey(name: 'lists')
  List<BooksListVO>? lists;

  EbooksResultsVO(this.lists);

  factory EbooksResultsVO.fromJson(Map<String, dynamic> json) =>
      _$EbooksResultsVOFromJson(json);
  Map<String, dynamic> toJson() => _$EbooksResultsVOToJson(this);
}