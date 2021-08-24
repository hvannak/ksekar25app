// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'postmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Postmodel _$PostmodelFromJson(Map<String, dynamic> json) {
  return Postmodel(
    json['_id'] as String?,
    json['lang'] as String,
    json['user'] as String,
    json['title'] as String,
    json['description'] as String,
    Imagedatamodel.fromJson(json['image'] as Map<String, dynamic>),
    DateTime.parse(json['date'] as String),
  );
}

Map<String, dynamic> _$PostmodelToJson(Postmodel instance) => <String, dynamic>{
      '_id': instance.id,
      'lang': instance.lang,
      'user': instance.user,
      'title': instance.title,
      'description': instance.description,
      'image': instance.image.toJson(),
      'date': instance.date.toIso8601String(),
    };
