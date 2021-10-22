import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:play_books/data/vos/book_vo.dart';
import 'package:play_books/persistence/constant.dart';

part 'books_list_vo.g.dart';

@HiveType(typeId: BOOKS_LIST_HIVE_TYPE_ID,adapterName: 'BooksListVOAdapter')
@JsonSerializable()
class BooksListVO {
  @HiveField(0)
  @JsonKey(name: 'list_name')
  String? listName;

  @HiveField(1)
  @JsonKey(name: 'list_name_encoded')
  String? listNameEncoded;

  @HiveField(2)
  @JsonKey(name: 'display_name')
  String? displayName;

  @HiveField(3)
  @JsonKey(name: 'books')
  List<BookVO>? books;

  BooksListVO(
      this.listName, this.listNameEncoded, this.displayName, this.books);


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BooksListVO &&
          runtimeType == other.runtimeType &&
          listName == other.listName &&
          displayName == other.displayName;

  @override
  int get hashCode => listName.hashCode ^ displayName.hashCode;

  factory BooksListVO.fromJson(Map<String, dynamic> json) =>
      _$BooksListVOFromJson(json);
  Map<String, dynamic> toJson() => _$BooksListVOToJson(this);
}
