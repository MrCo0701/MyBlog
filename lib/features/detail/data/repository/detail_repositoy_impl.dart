import 'package:dio/dio.dart';
import 'package:my_blog/core/config/env.dart';
import 'package:my_blog/core/network/api_constants.dart';
import 'package:my_blog/core/storage/token_storage.dart';
import 'package:my_blog/features/detail/data/mapper/comment_mapper.dart';
import 'package:my_blog/features/detail/data/models/comment/comment_model.dart';
import 'package:my_blog/features/detail/domain/entity/comment_entity.dart';
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

    try {
      final response = await dio.post(
        url,
        data: {"content": comment, "postId": idPost},
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

  @override
  Future<List<CommentEntity>> showAllComments(String idPost) async {
    final url = Env.baseUrl + ApiConstants.comment;

    try {
      final response = await dio.get(
        url,
        queryParameters: {"page": 1, "limit": 20, "postId": idPost},
      );

      final List<dynamic> data = response.data['data']['data'];
      final comments = data
          .map((e) => CommentModel.fromJson(e).toEntity())
          .toList();

      return comments;
    } catch (e) {
      print('==> Error to get comments: $e');
      return [];
    }
  }

  @override
  Future<bool> deleteComment(String idComment) async {
    final url = "${Env.baseUrl}${ApiConstants.comment}/$idComment";
    final token = await TokenStorage.getAccessToken();

    try {
      final response = await dio.delete(
        url,
        queryParameters: {"id": idComment},
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      return true;
    } catch (e) {
      print('==> Error to delete comment: $e');
      return false;
    }
  }

  @override
  Future<bool> updateComment(String idComment, String content, String postId) async {
    final url = "${Env.baseUrl}${ApiConstants.comment}/$idComment";
    final token = await TokenStorage.getAccessToken();

    try {
      final response = await dio.patch(
        url,
        data: {
          "content": content,
        },
        queryParameters: {"id": idComment},
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      return true;
    } catch (e) {
      print('==> Error to update comment: $e');
      return false;
    }
  }
}
