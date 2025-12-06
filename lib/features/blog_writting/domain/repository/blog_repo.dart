import 'package:my_blog/features/blog_writting/domain/entity/post_entity.dart';

abstract class BlogRepository {
  Future<bool> createBlog(PostEntity post);
}
