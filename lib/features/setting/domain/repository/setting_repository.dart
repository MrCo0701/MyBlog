import 'dart:io';

import 'package:my_blog/features/setting/domain/entity/user_info_entity.dart';

import '../../../home/domain/entity/blog_entity.dart';

abstract class SettingRepository {
  Future<UserInfoEntity> getUserInfo();

  Future<bool> changeUserInfo(File? file, String fullName);

  Future<List<BlogEntity>> getBlogById(String idUser);

  Future<void> logout();
}
