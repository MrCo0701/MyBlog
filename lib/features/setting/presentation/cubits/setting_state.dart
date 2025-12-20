import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_blog/features/home/domain/entity/blog_entity.dart';
import 'package:my_blog/features/setting/domain/entity/user_info_entity.dart';

part 'setting_state.freezed.dart';

@freezed
abstract class SettingState with _$SettingState {
  factory SettingState({
    required UserInfoEntity userInfo,
    required File? fileImage,
    required List<BlogEntity> blogs,
    required bool isSettingSuccess
  }) = _SettingState;
}
