import 'dart:io';

import 'package:my_blog/features/home/domain/entity/blog_entity.dart';
import 'package:my_blog/features/setting/domain/entity/user_info_entity.dart';
import 'package:my_blog/features/setting/domain/repository/setting_repository.dart';

class SettingUseCase {
  final SettingRepository repository;

  SettingUseCase(this.repository);

  Future<UserInfoEntity> getUserInfo() async {
    return repository.getUserInfo();
  }

  Future<bool> changeUserInfo(File? file, String fullName) async {
    return repository.changeUserInfo(file, fullName);
  }

  Future<List<BlogEntity>> getBlogsById(String idUser) async {
    return repository.getBlogById(idUser);
  }

  Future<void> logout () async {
    repository.logout();
  }
}
