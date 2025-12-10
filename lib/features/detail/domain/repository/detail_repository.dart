import 'package:my_blog/features/detail/domain/entity/comment_entity.dart';
import 'package:my_blog/features/detail/domain/entity/up_vote_entity.dart';

abstract class DetailRepository {
  Future<UpVoteEntity> upVote(String idBlog);

  Future<void> createComment(String comment, String idPost);

  Future<List<CommentEntity>> showAllComments(String idPost);

  Future<bool> deleteComment(String idComment);

  Future<bool> updateComment(String idComment, String content, String postId);
}
