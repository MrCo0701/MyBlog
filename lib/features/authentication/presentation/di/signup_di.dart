import 'package:my_blog/features/authentication/data/repository/auth_repo_impl.dart';
import 'package:my_blog/features/authentication/domain/use_case/auth_use_case.dart';
import 'package:my_blog/features/authentication/presentation/cubits/signup/signup_cubit.dart';

SignUpCubit signUpProvider () {
  final repo = AuthRepositoryImpl();
  final useCase = AuthUseCase(repo);
  return SignUpCubit(useCase);
}