import 'package:my_blog/features/detail/data/repository/detail_repositoy_impl.dart';
import 'package:my_blog/features/detail/domain/use_case/detail_use_case.dart';
import 'package:my_blog/features/detail/presentation/cubits/follow/follow_cubit.dart';

FollowCubit followProvider() {
  final repo = DetailRepositoryImpl();
  final useCase = DetailUseCase(repo);
  return FollowCubit(useCase);
}