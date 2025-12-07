import 'package:my_blog/features/home/data/repository/home_repo_impl.dart';
import 'package:my_blog/features/home/domain/use_case/home_use_case.dart';
import 'package:my_blog/features/home/presentation/cubits/home_cubit.dart';

HomeCubit homeProvider() {
  final repo = HomeRepositoryImpl();
  final useCase = HomeUseCase(repository: repo);
  return HomeCubit(useCase);
}
