import 'package:my_blog/features/detail/data/repository/summarize_blog_repository_impl.dart';
import 'package:my_blog/features/detail/domain/use_case/summarize_use_case.dart';
import 'package:my_blog/features/detail/presentation/cubits/summarize_blog/summarize_blog_cubit.dart';

SummarizeBlogCubit summarizeProvider() {
  final repo = SummarizeBlogRepositoryImpl();
  final useCase = SummarizeUseCase(repository: repo);
  return SummarizeBlogCubit(useCase);
}