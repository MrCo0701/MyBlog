import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_blog/features/detail/data/models/user_comment/user_comment_model.dart';

part 'comment_model.freezed.dart';

part 'comment_model.g.dart';

@freezed
abstract class CommentModel with _$CommentModel {
  const factory CommentModel({
    required String id,
    required String content,
    required String postId,

    String? parentId,

    required DateTime createdAt,
    required DateTime updatedAt,

    required UserCommentModel user,
  }) = _CommentModel;

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);
}
