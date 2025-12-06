// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PostModel _$PostModelFromJson(Map<String, dynamic> json) => _PostModel(
  title: json['title'] as String,
  contentType: json['contentType'] as String,
  content: (json['content'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
  description: json['description'] as String,
  thumbnail: json['thumbnail'] as String,
  seriesId: (json['seriesId'] as num?)?.toInt(),
  published: json['published'] as bool,
  readTime: (json['readTime'] as num).toInt(),
  tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$PostModelToJson(_PostModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'contentType': instance.contentType,
      'content': instance.content,
      'description': instance.description,
      'thumbnail': instance.thumbnail,
      'seriesId': instance.seriesId,
      'published': instance.published,
      'readTime': instance.readTime,
      'tags': instance.tags,
    };
