import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_comment_model.freezed.dart';
part 'user_comment_model.g.dart';

@freezed
abstract class UserCommentModel with _$UserCommentModel {
  const factory UserCommentModel({
    required String id,
    required String fullName,
    required String? avatarUrl,
  }) = _UserCommentModel;

  factory UserCommentModel.fromJson(Map<String, dynamic> json) =>
      _$UserCommentModelFromJson(json);
}
