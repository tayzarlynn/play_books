// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'books_list_by_name_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BooksListByNameResponse _$BooksListByNameResponseFromJson(
    Map<String, dynamic> json) {
  return BooksListByNameResponse(
    json['results'] == null
        ? null
        : EbooksResultByNameVO.fromJson(
            json['results'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BooksListByNameResponseToJson(
        BooksListByNameResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
