import 'package:my_blog/features/authentication/domain/entity/user.dart';

abstract class AuthRepository {
  Future<void> signUp(UserEntity user);
}