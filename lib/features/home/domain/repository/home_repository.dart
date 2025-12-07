import 'package:my_blog/features/home/domain/entity/blog_entity.dart';

abstract class HomeRepository {
  Future<List<BlogEntity>> showAllBlog();
}
