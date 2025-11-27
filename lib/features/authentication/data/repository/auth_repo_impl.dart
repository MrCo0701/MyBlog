import 'package:dio/dio.dart';
import 'package:my_blog/core/config/env.dart';
import 'package:my_blog/core/network/api_constants.dart';
import 'package:my_blog/features/authentication/data/models/user_model.dart';
import 'package:my_blog/features/authentication/domain/entity/user.dart';
import 'package:my_blog/features/authentication/domain/repository/auth_repo.dart';

class AuthRepositoryImpl implements AuthRepository {
  final dio = Dio();

  @override
  Future<void> signUp(UserEntity user) async {
    final url = Env.baseUrl + ApiConstants.register;
    final userModel = UserModel.fromEntity(user);

    try {
      final response = await dio.post(
        url,
        data: userModel.toJson(),
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      print(response.data);
    } on DioException catch (e) {
      print('==> Error: $e');
    }
  }
}
