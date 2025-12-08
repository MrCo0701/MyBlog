import 'package:dio/dio.dart';
import 'package:my_blog/core/config/env.dart';
import 'package:my_blog/core/network/api_constants.dart';
import 'package:my_blog/core/storage/token_storage.dart';
import 'package:my_blog/features/detail/domain/entity/up_vote_entity.dart';
import 'package:my_blog/features/detail/domain/repository/detail_repository.dart';

class DetailRepositoryImpl implements DetailRepository {
  final dio = Dio();

  @override
  Future<UpVoteEntity> upVote(String idBlog) async {
    final token = await TokenStorage.getAccessToken();
    final url = "${Env.baseUrl}${ApiConstants.postBlog}/$idBlog/upvote";

    try {
      final response = await dio.post(
        url,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      print(response.data);

      final isUpvoted = response.data['data']['isUpvoted'];
      final totalUpvoted = response.data['data']['totalUpvotes'];
      final entity = UpVoteEntity(
        isUpVoted: isUpvoted,
        totalVote: totalUpvoted,
      );
      return entity;
    } catch (e) {
      print('==> Error to upVote: $e');
      return UpVoteEntity(isUpVoted: true, totalVote: 0);
    }
  }

  @override
  Future<void> createComment(String comment, String idPost) async {
    final token = await TokenStorage.getAccessToken();
    final url = Env.baseUrl + ApiConstants.comment;

    print('==> ID BLOG: $idPost');

    try {
      final response = await dio.post(
        url,
        data: {"content": comment, "postId": idPost, "parentId": null},
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      print(response.data);
    } catch (e) {
      print('==> Error to comment: $e');
    }
  }
}
