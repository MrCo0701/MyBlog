import 'package:freezed_annotation/freezed_annotation.dart';

part 'quill_model.freezed.dart';
part 'quill_model.g.dart';

@freezed
abstract class DeltaOpModel with _$DeltaOpModel {
  const factory DeltaOpModel({
    required dynamic insert,
    Map<String, dynamic>? attributes,
  }) = _DeltaOpModel;

  factory DeltaOpModel.fromJson(Map<String, dynamic> json) =>
      _$DeltaOpModelFromJson(json);
}