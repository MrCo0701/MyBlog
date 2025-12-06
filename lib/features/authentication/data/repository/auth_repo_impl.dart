import 'package:dio/dio.dart';
import 'package:my_blog/core/config/env.dart';
import 'package:my_blog/core/network/api_constants.dart';
import 'package:my_blog/core/storage/token_storage.dart';
import 'package:my_blog/features/authentication/data/models/user_model.dart';
import 'package:my_blog/features/authentication/domain/entity/user.dart';
import 'package:my_blog/features/authentication/domain/repository/auth_repo.dart';

import '../../../../core/exceptions/app_exception.dart';

class AuthRepositoryImpl implements AuthRepository {
  final dio = Dio();

  @override
  Future<bool> signUp(UserEntity user) async {
    final url = Env.baseUrl + ApiConstants.register;
    final userModel = UserModel.fromEntity(user);

    try {
      await dio.post(
        url,
        data: userModel.toJson(),
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      return true;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        throw NetworkException();
      }

      final statusCode = e.response?.statusCode;

      if (statusCode == 409) {
        throw ConflictException();
      }

      if (statusCode == 500) {
        throw ServerException();
      }

      throw UnknownException();
    }
  }

  @override
  Future<bool> singIn(String email, String password) async {
    final url = Env.baseUrl + ApiConstants.login;

    try {
      final response = await dio.post(
        url,
        data: {'email': email, 'password': password},
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            // "Authorization": "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9",
          },
        ),
      );

      final accessToken = response.data['data']['accessToken'];
      final refreshToken = response.data['data']['refreshToken'];

      TokenStorage.saveToken(accessToken, refreshToken);

      return true;
    } catch (e) {
      return false;
    }
  }
}
