// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'books_list_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BooksListVOAdapter extends TypeAdapter<BooksListVO> {
  @override
  final int typeId = 2;

  @override
  BooksListVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BooksListVO(
      fields[0] as String?,
      fields[1] as String?,
      fields[2] as String?,
      (fields[3] as List?)?.cast<BookVO>(),
    );
  }

  @override
  void write(BinaryWriter writer, BooksListVO obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.listName)
      ..writeByte(1)
      ..write(obj.listNameEncoded)
      ..writeByte(2)
      ..write(obj.displayName)
      ..writeByte(3)
      ..write(obj.books);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BooksListVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BooksListVO _$BooksListVOFromJson(Map<String, dynamic> json) {
  return BooksListVO(
    json['list_name'] as String?,
    json['list_name_encoded'] as String?,
    json['display_name'] as String?,
    (json['books'] as List<dynamic>?)
        ?.map((e) => BookVO.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$BooksListVOToJson(BooksListVO instance) =>
    <String, dynamic>{
      'list_name': instance.listName,
      'list_name_encoded': instance.listNameEncoded,
      'display_name': instance.displayName,
      'books': instance.books,
    };
