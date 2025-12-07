import 'package:dio/dio.dart';
import 'package:my_blog/core/config/env.dart';
import 'package:my_blog/core/network/api_constants.dart';
import 'package:my_blog/features/home/data/models/blog/blog_model.dart';
import 'package:my_blog/features/home/domain/entity/blog_entity.dart';
import 'package:my_blog/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final dio = Dio();

  @override
  Future<List<BlogEntity>> showAllBlog() async {
    final url = Env.baseUrl + ApiConstants.postBlog;

    try {
      final res = await dio.get(url, queryParameters: {"page": 1, "limit": 20});

      final List<dynamic> data = res.data["data"]["data"];

      final blogs = data.map((e) => BlogModel.fromJson(e).toEntity()).toList();

      return blogs;
    } catch (e) {
      print("==> Error showAllBlog: $e");
      return [];
    }
  }
}
