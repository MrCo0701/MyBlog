// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quill_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeltaOpModel _$DeltaOpModelFromJson(Map<String, dynamic> json) =>
    _DeltaOpModel(
      insert: json['insert'],
      attributes: json['attributes'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$DeltaOpModelToJson(_DeltaOpModel instance) =>
    <String, dynamic>{
      'insert': instance.insert,
      'attributes': instance.attributes,
    };
