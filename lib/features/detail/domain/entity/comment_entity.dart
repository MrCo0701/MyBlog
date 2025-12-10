import 'package:my_blog/features/detail/domain/entity/user_comment_entity.dart';

class CommentEntity {
  final String id;
  final String content;
  final String postId;
  final String? parentId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final UserCommentEntity user;

  const CommentEntity({
    required this.id,
    required this.content,
    required this.postId,
    this.parentId,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });
}
