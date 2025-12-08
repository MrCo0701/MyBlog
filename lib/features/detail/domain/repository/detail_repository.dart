import 'package:my_blog/features/detail/domain/entity/up_vote_entity.dart';

abstract class DetailRepository {
  Future<UpVoteEntity> upVote(String idBlog);

  Future<void> createComment(String comment, String idPost);
}
