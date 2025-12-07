import 'package:my_blog/features/home/domain/entity/blog_entity.dart';

class HomeState {
  final List<BlogEntity> allBlogs;

  HomeState({required this.allBlogs});
}
