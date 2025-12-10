import 'package:my_blog/features/detail/data/models/user_comment/user_comment_model.dart';
import 'package:my_blog/features/detail/domain/entity/user_comment_entity.dart';

extension UserModelMapper on UserCommentModel {
  UserCommentEntity toEntity() {
    return UserCommentEntity(id: id, fullName: fullName, avatarUrl: avatarUrl);
  }
}
