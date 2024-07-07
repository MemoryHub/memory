// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      json['id'] as String,
      json['ownerId'] as String,
      json['deviceId'] as String,
      json['type'] as String,
      json['originalMimeType'] as String,
      json['originalFileName'] as String,
      json['originalPath'] as String,
      json['thumbhash'] as String,
      DateTime.parse(json['fileCreatedAt'] as String),
      DateTime.parse(json['fileModifiedAt'] as String),
      DateTime.parse(json['localDateTime'] as String),
      DateTime.parse(json['updatedAt'] as String),
      json['duration'] as String,
      json['checksum'] as String,
      json['isOffline'] as bool,
      json['isFavorite'] as bool,
      json['isArchived'] as bool,
      json['isTrashed'] as bool,
      json['hasMetadata'] as bool,
      json['livePhotoVideoId'] as String?,
      json['duplicateId'] as String?,
      json['resized'] as bool,
      json['deviceAssetId'] as String?,
      json['libraryId'] as String?,
    );

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'id': instance.id,
      'ownerId': instance.ownerId,
      'deviceId': instance.deviceId,
      'type': instance.type,
      'originalMimeType': instance.originalMimeType,
      'originalFileName': instance.originalFileName,
      'originalPath': instance.originalPath,
      'thumbhash': instance.thumbhash,
      'fileCreatedAt': instance.fileCreatedAt.toIso8601String(),
      'fileModifiedAt': instance.fileModifiedAt.toIso8601String(),
      'localDateTime': instance.localDateTime.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'duration': instance.duration,
      'checksum': instance.checksum,
      'isOffline': instance.isOffline,
      'isFavorite': instance.isFavorite,
      'isArchived': instance.isArchived,
      'isTrashed': instance.isTrashed,
      'hasMetadata': instance.hasMetadata,
      'livePhotoVideoId': instance.livePhotoVideoId,
      'duplicateId': instance.duplicateId,
      'resized': instance.resized,
      'deviceAssetId': instance.deviceAssetId,
      'libraryId': instance.libraryId,
    };
