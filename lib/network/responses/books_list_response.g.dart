// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'books_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BooksListResponse _$BooksListResponseFromJson(Map<String, dynamic> json) {
  return BooksListResponse(
    json['results'] == null
        ? null
        : EbooksResultsVO.fromJson(json['results'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BooksListResponseToJson(BooksListResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
