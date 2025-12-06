import 'package:my_blog/features/blog_writting/data/repository/blog_repo_impl.dart';
import 'package:my_blog/features/blog_writting/domain/use_case/blog_use_case.dart';
import 'package:my_blog/features/blog_writting/presentation/cubits/writing_cubit.dart';

WritingCubit blogProvider() {
  final repo = BlogRepositoryImpl();
  final useCase = BlogUseCase(repo);
  return WritingCubit(useCase);
}
