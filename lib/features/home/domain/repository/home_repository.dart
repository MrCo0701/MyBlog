import 'package:my_blog/features/home/domain/entity/blog_entity.dart';

abstract class HomeRepository {
  Future<List<BlogEntity>> showAllBlog();

  Future<List<BlogEntity>> searchBlog(String titleSearch);

  Future<List<BlogEntity>> searchBlogByTag(String titleSearch);

  Future<List<BlogEntity>> showTrendingBlogs();
}
