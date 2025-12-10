import 'package:my_blog/features/detail/domain/entity/comment_entity.dart';

import '../models/comment/comment_model.dart';
import 'user_mapper.dart';

extension CommentModelMapper on CommentModel {
  CommentEntity toEntity() {
    return CommentEntity(
      id: id,
      content: content,
      postId: postId,
      parentId: parentId,
      createdAt: createdAt,
      updatedAt: updatedAt,
      user: user.toEntity(),
    );
  }
}
