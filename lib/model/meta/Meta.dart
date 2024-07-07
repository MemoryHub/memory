library my_library.model.meta;

import 'package:json_annotation/json_annotation.dart';

part 'Meta.g.dart';
// flutter pub run build_runner build --delete-conflicting-outputs

@JsonSerializable()
class Meta {
  String id;
  String ownerId;
  String deviceId; // 设备ID WEB
  String type; // 文件系统类型 （系统中定义的类型）IMAGE
  String originalMimeType; // 原始文件类型
  String originalFileName; // 原始文件名
  String originalPath; // 原始文件路径
  String thumbhash; // 缩略图hash
  DateTime fileCreatedAt; // 文件创建时间
  DateTime fileModifiedAt; // 文件修改时间
  DateTime localDateTime; // 本地时间
  DateTime updatedAt; // 更新时间
  String duration; // 时长
  String checksum; // 校验码
  // int stackCount; // 堆叠次数
  bool isOffline; // 是否离线
  bool isFavorite; // 是否收藏
  bool isArchived; // 是否归档
  bool isTrashed; // 是否删除
  bool hasMetadata; // 是否有元数据
  String? livePhotoVideoId; // 苹果手机livephoto
  String? duplicateId; // 复制ID
  bool resized; // 是否缩放
  String? deviceAssetId; // 设备资源ID
  String? libraryId; // 图库ID

  Meta(
      this.id,
      this.ownerId,
      this.deviceId,
      this.type,
      this.originalMimeType,
      this.originalFileName,
      this.originalPath,
      this.thumbhash,
      this.fileCreatedAt,
      this.fileModifiedAt,
      this.localDateTime,
      this.updatedAt,
      this.duration,
      this.checksum,
      // this.stackCount,
      this.isOffline,
      this.isFavorite,
      this.isArchived,
      this.isTrashed,
      this.hasMetadata,
      this.livePhotoVideoId,
      this.duplicateId,
      this.resized,
      this.deviceAssetId,
      this.libraryId);

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}
