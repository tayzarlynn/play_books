import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:play_books/persistence/constant.dart';

part 'image_links_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: IMAGE_LINK_HIVE_TYPE_ID,adapterName: 'ImageLinksVOAdapter')
class ImageLinksVO{
  @HiveField(0)
  @JsonKey(name: 'smallThumbnail')
  String? smallThumbnail;

  @HiveField(2)
  @JsonKey(name: 'thumbnail')
  String? thumbnail;

  ImageLinksVO(this.smallThumbnail, this.thumbnail);

  factory ImageLinksVO.fromJson(Map<String, dynamic> json) => _$ImageLinksVOFromJson(json);
  Map<String, dynamic> toJson() => _$ImageLinksVOToJson(this);
}