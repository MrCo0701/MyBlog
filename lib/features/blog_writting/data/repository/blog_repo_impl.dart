import 'package:dio/dio.dart';
import 'package:my_blog/core/config/env.dart';
import 'package:my_blog/core/network/api_constants.dart';
import 'package:my_blog/core/storage/token_storage.dart';
import 'package:my_blog/features/blog_writting/data/models/post_model.dart';
import 'package:my_blog/features/blog_writting/domain/entity/post_entity.dart';
import 'package:my_blog/features/blog_writting/domain/repository/blog_repo.dart';

class BlogRepositoryImpl implements BlogRepository {
  final dio = Dio();

  @override
  Future<bool> createBlog(PostEntity post) async {
    final url = Env.baseUrl + ApiConstants.postBlog;
    final accessToken = await TokenStorage.getAccessToken();
    final postModel = PostModel.fromEntity(post);

    try {
      print(postModel.toJson());

      final response = await dio.post(
        url,
        data: postModel.toJson(),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $accessToken',
          },
        ),
      );
      print(response.data);
      return true;
    } catch (e) {
      print('==> Error: $e');
      return false;
    }
  }
}
