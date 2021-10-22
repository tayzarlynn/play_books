// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ebooks_result_by_name_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EbooksResultByNameVO _$EbooksResultByNameVOFromJson(Map<String, dynamic> json) {
  return EbooksResultByNameVO(
    (json['books'] as List<dynamic>?)
        ?.map((e) => BookVO.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$EbooksResultByNameVOToJson(
        EbooksResultByNameVO instance) =>
    <String, dynamic>{
      'books': instance.books,
    };
