// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookVOAdapter extends TypeAdapter<BookVO> {
  @override
  final int typeId = 1;

  @override
  BookVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookVO(
      fields[0] as String?,
      (fields[1] as List?)?.cast<String>(),
      fields[2] as String?,
      fields[3] as int?,
      fields[4] as int?,
      fields[5] as String?,
      fields[6] as String?,
      fields[7] as String?,
      fields[8] as String?,
      fields[9] as String?,
      fields[10] as String?,
      fields[11] as String?,
      fields[12] as ImageLinksVO?,
      fields[13] as String?,
      fields[14] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, BookVO obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.author)
      ..writeByte(1)
      ..write(obj.authors)
      ..writeByte(2)
      ..write(obj.bookImage)
      ..writeByte(3)
      ..write(obj.bookImageWidth)
      ..writeByte(4)
      ..write(obj.bookImageHeight)
      ..writeByte(5)
      ..write(obj.bookReviewLink)
      ..writeByte(6)
      ..write(obj.contributor)
      ..writeByte(7)
      ..write(obj.createdDate)
      ..writeByte(8)
      ..write(obj.description)
      ..writeByte(9)
      ..write(obj.price)
      ..writeByte(10)
      ..write(obj.publisher)
      ..writeByte(11)
      ..write(obj.title)
      ..writeByte(12)
      ..write(obj.imageLinks)
      ..writeByte(13)
      ..write(obj.queryValue)
      ..writeByte(14)
      ..write(obj.listNameEncode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookVO _$BookVOFromJson(Map<String, dynamic> json) {
  return BookVO(
    json['author'] as String?,
    (json['authors'] as List<dynamic>?)?.map((e) => e as String).toList(),
    json['book_image'] as String?,
    json['book_image_width'] as int?,
    json['book_image_height'] as int?,
    json['book_review_link'] as String?,
    json['contributor'] as String?,
    json['created_date'] as String?,
    json['description'] as String?,
    json['price'] as String?,
    json['publisher'] as String?,
    json['title'] as String?,
    json['imageLinks'] == null
        ? null
        : ImageLinksVO.fromJson(json['imageLinks'] as Map<String, dynamic>),
    json['queryValue'] as String?,
    json['listNameEncode'] as String?,
  );
}

Map<String, dynamic> _$BookVOToJson(BookVO instance) => <String, dynamic>{
      'author': instance.author,
      'authors': instance.authors,
      'book_image': instance.bookImage,
      'book_image_width': instance.bookImageWidth,
      'book_image_height': instance.bookImageHeight,
      'book_review_link': instance.bookReviewLink,
      'contributor': instance.contributor,
      'created_date': instance.createdDate,
      'description': instance.description,
      'price': instance.price,
      'publisher': instance.publisher,
      'title': instance.title,
      'imageLinks': instance.imageLinks,
      'queryValue': instance.queryValue,
      'listNameEncode': instance.listNameEncode,
    };
