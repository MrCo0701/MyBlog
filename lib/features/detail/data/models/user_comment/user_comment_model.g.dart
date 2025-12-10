// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserCommentModel _$UserCommentModelFromJson(Map<String, dynamic> json) =>
    _UserCommentModel(
      id: json['id'] as String,
      fullName: json['fullName'] as String,
      avatarUrl: json['avatarUrl'] as String?,
    );

Map<String, dynamic> _$UserCommentModelToJson(_UserCommentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'avatarUrl': instance.avatarUrl,
    };
