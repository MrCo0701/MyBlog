import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_blog/core/config/env.dart';
import 'package:my_blog/core/network/api_constants.dart';
import 'package:my_blog/core/storage/token_storage.dart';
import 'package:my_blog/features/setting/data/models/user_info/user_info_model.dart';
import 'package:my_blog/features/setting/data/models/user_stats/user_stats_model.dart';
import 'package:my_blog/features/setting/domain/entity/user_info_entity.dart';
import 'package:my_blog/features/setting/domain/repository/setting_repository.dart';

import '../../../home/data/models/blog/blog_model.dart';
import '../../../home/domain/entity/blog_entity.dart';

class SettingRepositoryImpl implements SettingRepository {
  final dio = Dio();

  @override
  Future<UserInfoEntity> getUserInfo() async {
    final accessToken = await TokenStorage.getAccessToken();
    final url = Env.baseUrl + ApiConstants.me;

    try {
      final response = await dio.get(
        url,
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
          },
        ),
      );

      final userInfo = UserInfoModel.fromJson(response.data['data']).toEntity();

      return userInfo;
    } catch (e) {
      print('==> Error to get Info of user: $e');
      return UserInfoEntity.empty();
    }
  }

  Future<String> uploadAvatar(File? file) async {
    final url = Env.baseUrl + ApiConstants.uploadImage;
    final token = await TokenStorage.getAccessToken();

    if (file == null) {
      return '';
    } else {
      try {
        final formData = FormData.fromMap({
          "image": await MultipartFile.fromFile(
            file.path,
            filename: file.path.split('/').last,
          ),
        });

        final res = await dio.post(
          url,
          data: formData,
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
              'Content-Type': 'application/json',
            },
          ),
        );

        return res.data['data']['url'];
      } catch (e) {
        throw Exception('Error to uploadAVT: $e');
      }
    }
  }

  @override
  Future<bool> changeUserInfo(File? file, String fullName) async {
    String imgUrl = await uploadAvatar(file);
    final url = Env.baseUrl + ApiConstants.changeUser;
    final token = await TokenStorage.getAccessToken();

    try {
      dio.patch(
        url,
        data: {'fullName': fullName, 'avatarUrl': imgUrl},
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      print('==> CHECKKKKK');
      return true;
    } catch (e) {
      print('==> Error to change userInfo: $e');
      return false;
    }
  }

  @override
  Future<List<BlogEntity>> getBlogById(String idUser) async {
    final url = Env.baseUrl + ApiConstants.postBlog;

    try {
      final res = await dio.get(
        url,
        queryParameters: {"page": 1, "limit": 20, "authorId": idUser},
      );

      final List<dynamic> data = res.data["data"]["data"];
      final blogs = data.map((e) => BlogModel.fromJson(e).toEntity()).toList();

      return blogs;
    } catch (e) {
      print("==> Error showAllBlog: $e");
      return [];
    }
  }

  @override
  Future<void> logout() async{
    await TokenStorage.cleanToken();
  }
}

extension UserInfoModelMapper on UserInfoModel {
  UserInfoEntity toEntity() {
    return UserInfoEntity(
      id: id,
      email: email,
      fullName: fullName,
      avatarUrl: avatarUrl,
      stats: stats.toEntity(),
    );
  }
}
