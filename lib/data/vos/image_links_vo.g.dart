// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_links_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImageLinksVOAdapter extends TypeAdapter<ImageLinksVO> {
  @override
  final int typeId = 3;

  @override
  ImageLinksVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImageLinksVO(
      fields[0] as String?,
      fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ImageLinksVO obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.smallThumbnail)
      ..writeByte(2)
      ..write(obj.thumbnail);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageLinksVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageLinksVO _$ImageLinksVOFromJson(Map<String, dynamic> json) {
  return ImageLinksVO(
    json['smallThumbnail'] as String?,
    json['thumbnail'] as String?,
  );
}

Map<String, dynamic> _$ImageLinksVOToJson(ImageLinksVO instance) =>
    <String, dynamic>{
      'smallThumbnail': instance.smallThumbnail,
      'thumbnail': instance.thumbnail,
    };
