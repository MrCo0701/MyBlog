// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_stats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserStatsModel _$UserStatsModelFromJson(Map<String, dynamic> json) =>
    _UserStatsModel(
      postsCount: (json['postsCount'] as num).toInt(),
      seriesCount: (json['seriesCount'] as num).toInt(),
    );

Map<String, dynamic> _$UserStatsModelToJson(_UserStatsModel instance) =>
    <String, dynamic>{
      'postsCount': instance.postsCount,
      'seriesCount': instance.seriesCount,
    };
