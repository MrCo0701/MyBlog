import 'package:my_blog/features/authentication/domain/entity/user.dart';
import 'package:my_blog/features/authentication/domain/repository/auth_repo.dart';

class AuthUseCase {
  final AuthRepository repository;

  AuthUseCase(this.repository);

  Future<bool> signUp(UserEntity user) async {
    return repository.signUp(user);
  }

  Future<bool> singIn(String email, String password) async {
    return repository.singIn(email, password);
  }
}
