// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seri_with_count_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SeriesWithCountModel _$SeriesWithCountModelFromJson(
  Map<String, dynamic> json,
) => _SeriesWithCountModel(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  description: json['description'] as String,
  slug: json['slug'] as String,
  createdAt: json['createdAt'] as String,
  author: AuthorModel.fromJson(json['author'] as Map<String, dynamic>),
  count: CountSeriesModel.fromJson(json['_count'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SeriesWithCountModelToJson(
  _SeriesWithCountModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'slug': instance.slug,
  'createdAt': instance.createdAt,
  'author': instance.author,
  '_count': instance.count,
};
