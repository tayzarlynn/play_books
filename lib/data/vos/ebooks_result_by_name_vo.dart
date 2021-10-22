import 'package:json_annotation/json_annotation.dart';
import 'package:play_books/data/vos/book_vo.dart';

part 'ebooks_result_by_name_vo.g.dart';

@JsonSerializable()
class EbooksResultByNameVO{
  @JsonKey(name: 'books')
 List<BookVO>? books;

  EbooksResultByNameVO(this.books);

  factory EbooksResultByNameVO.fromJson(Map<String, dynamic> json) => _$EbooksResultByNameVOFromJson(json);
  Map<String, dynamic> toJson() => _$EbooksResultByNameVOToJson(this);
}