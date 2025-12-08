import 'package:my_blog/features/home/domain/entity/blog_entity.dart';
import 'package:my_blog/features/home/domain/repository/home_repository.dart';

class HomeUseCase {
  final HomeRepository repository;

  HomeUseCase({required this.repository});

  Future<List<BlogEntity>> getAllBlog() async {
    return repository.showAllBlog();
  }

  Future<List<BlogEntity>> searchBlog(String titleSearch) async {
    return repository.searchBlog(titleSearch);
  }
}
