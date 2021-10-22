// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookSearchResponse _$BookSearchResponseFromJson(Map<String, dynamic> json) {
  return BookSearchResponse(
    (json['items'] as List<dynamic>?)
        ?.map((e) => e == null
            ? null
            : BookSearchResult.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$BookSearchResponseToJson(BookSearchResponse instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
