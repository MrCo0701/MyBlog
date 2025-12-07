// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BlogModel _$BlogModelFromJson(Map<String, dynamic> json) => _BlogModel(
  id: json['id'] as String?,
  title: json['title'] as String?,
  content: (json['content'] as List<dynamic>)
      .map((e) => DeltaOpModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  published: json['published'] as bool,
  tags: (json['tags'] as List<dynamic>)
      .map((e) => TagModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  readTime: (json['readTime'] as num).toInt(),
  viewCount: (json['viewCount'] as num).toInt(),
  createdAt: json['createdAt'] as String?,
  author: AuthorModel.fromJson(json['author'] as Map<String, dynamic>),
);

Map<String, dynamic> _$BlogModelToJson(_BlogModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'published': instance.published,
      'tags': instance.tags,
      'readTime': instance.readTime,
      'viewCount': instance.viewCount,
      'createdAt': instance.createdAt,
      'author': instance.author,
    };
