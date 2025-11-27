import 'package:my_blog/features/authentication/domain/entity/user.dart';
import 'package:my_blog/features/authentication/domain/repository/auth_repo.dart';

class AuthUseCase {
  final AuthRepository repository;

  AuthUseCase(this.repository);

  Future<bool> signUp(UserEntity user) async {
    try {
      await repository.signUp(user);
      return true;
    } catch (e) {
      return false;
    }
  }
}
