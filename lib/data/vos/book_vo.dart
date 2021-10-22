import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:play_books/data/vos/image_links_vo.dart';
import 'package:play_books/persistence/constant.dart';

part 'book_vo.g.dart';

@HiveType(typeId: BOOK_VO_HIVE_TYPE_ID, adapterName: 'BookVOAdapter')
@JsonSerializable()
class BookVO {
  @HiveField(0)
  @JsonKey(name: 'author')
  String? author;

  @HiveField(1)
  @JsonKey(name: 'authors')
  List<String>? authors;

  @HiveField(2)
  @JsonKey(name: 'book_image')
  String? bookImage;

  @HiveField(3)
  @JsonKey(name: 'book_image_width')
  int? bookImageWidth;

  @HiveField(4)
  @JsonKey(name: 'book_image_height')
  int? bookImageHeight;

  @HiveField(5)
  @JsonKey(name: 'book_review_link')
  String? bookReviewLink;

  @HiveField(6)
  @JsonKey(name: 'contributor')
  String? contributor;

  @HiveField(7)
  @JsonKey(name: 'created_date')
  String? createdDate;

  @HiveField(8)
  @JsonKey(name: 'description')
  String? description;

  @HiveField(9)
  @JsonKey(name: 'price')
  String? price;

  @HiveField(10)
  @JsonKey(name: 'publisher')
  String? publisher;

  @HiveField(11)
  @JsonKey(name: 'title')
  String? title;

  @HiveField(12)
  @JsonKey(name: 'imageLinks')
  ImageLinksVO? imageLinks;

  @HiveField(13)
  String? queryValue;

  @HiveField(14)
  String? listNameEncode;



  BookVO(
    this.author,
    this.authors,
    this.bookImage,
    this.bookImageWidth,
    this.bookImageHeight,
    this.bookReviewLink,
    this.contributor,
    this.createdDate,
    this.description,
    this.price,
    this.publisher,
    this.title,
    this.imageLinks,
    this.queryValue,
    this.listNameEncode,
  );


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookVO &&
          runtimeType == other.runtimeType &&
          author == other.author &&
          title == other.title &&
          queryValue == other.queryValue &&
          listNameEncode == other.listNameEncode;

  @override
  int get hashCode =>
      author.hashCode ^
      title.hashCode ^
      queryValue.hashCode ^
      listNameEncode.hashCode;

  factory BookVO.fromJson(Map<String, dynamic> json) => _$BookVOFromJson(json);
  Map<String, dynamic> toJson() => _$BookVOToJson(this);
}
