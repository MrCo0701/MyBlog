import 'package:my_blog/features/detail/domain/repository/summarize_blog_repository.dart';

class SummarizeUseCase {
  final SummarizeBlogRepository repository;

  SummarizeUseCase({required this.repository});

  Future<String> summarizeBlog(String content) async {
    return repository.summarizeBlog(content);
  }
}