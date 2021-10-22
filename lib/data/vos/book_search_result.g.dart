// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookSearchResult _$BookSearchResultFromJson(Map<String, dynamic> json) {
  return BookSearchResult(
    json['volumeInfo'] == null
        ? null
        : BookVO.fromJson(json['volumeInfo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BookSearchResultToJson(BookSearchResult instance) =>
    <String, dynamic>{
      'volumeInfo': instance.volumeInfo,
    };
