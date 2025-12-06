import 'package:my_blog/features/blog_writting/domain/entity/post_entity.dart';
import 'package:my_blog/features/blog_writting/domain/repository/blog_repo.dart';

class BlogUseCase {
  final BlogRepository repository;
  BlogUseCase(this.repository);


  Future<bool> uploadBlog(PostEntity post) async {
    return repository.createBlog(post);
  }
}