// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seri_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SeriesDetailModel _$SeriesDetailModelFromJson(Map<String, dynamic> json) =>
    _SeriesDetailModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      slug: json['slug'] as String,
      description: json['description'] as String,
      createdAt: json['createdAt'] as String,
      author: AuthorModel.fromJson(json['author'] as Map<String, dynamic>),
      posts: (json['posts'] as List<dynamic>)
          .map((e) => BlogModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SeriesDetailModelToJson(_SeriesDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'description': instance.description,
      'createdAt': instance.createdAt,
      'author': instance.author,
      'posts': instance.posts,
    };
