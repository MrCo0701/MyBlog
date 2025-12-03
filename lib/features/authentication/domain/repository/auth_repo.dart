import 'package:my_blog/features/authentication/domain/entity/user.dart';

abstract class AuthRepository {
  Future<bool> signUp(UserEntity user);
  Future<bool> singIn(String email , String password);
}