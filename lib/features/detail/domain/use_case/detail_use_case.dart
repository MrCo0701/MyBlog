import 'package:my_blog/features/detail/domain/entity/comment_entity.dart';
import 'package:my_blog/features/detail/domain/entity/up_vote_entity.dart';
import 'package:my_blog/features/detail/domain/repository/detail_repository.dart';

class DetailUseCase {
  final DetailRepository repository;

  DetailUseCase(this.repository);

  Future<UpVoteEntity> upVote(String idBlog) async {
    return repository.upVote(idBlog);
  }

  Future<void> createComment(String comment, String idPost) async {
    return repository.createComment(comment, idPost);
  }

  Future<List<CommentEntity>> getAllComments(String idPost) async {
    return repository.showAllComments(idPost);
  }

  Future<bool> deleteComment(String idComment) async {
    return repository.deleteComment(idComment);
  }

  Future<bool> updateComment(
    String idComment,
    String content,
    String postId,
  ) async {
    return repository.updateComment(idComment, content, postId);
  }
}
