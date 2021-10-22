// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ebooks_results_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EbooksResultsVO _$EbooksResultsVOFromJson(Map<String, dynamic> json) {
  return EbooksResultsVO(
    (json['lists'] as List<dynamic>?)
        ?.map((e) => BooksListVO.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$EbooksResultsVOToJson(EbooksResultsVO instance) =>
    <String, dynamic>{
      'lists': instance.lists,
    };
