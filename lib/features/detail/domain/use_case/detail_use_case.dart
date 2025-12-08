import 'package:my_blog/features/detail/domain/entity/up_vote_entity.dart';
import 'package:my_blog/features/detail/domain/repository/detail_repository.dart';

class DetailUseCase {
  final DetailRepository repository;

  DetailUseCase(this.repository);

  Future<UpVoteEntity> upVote(String idBlog) async {
    return repository.upVote(idBlog);
  }
}
