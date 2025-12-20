import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_blog/features/setting/domain/entity/user_info_entity.dart';
import 'package:my_blog/features/setting/domain/use_case/setting_use_case.dart';
import 'package:my_blog/features/setting/presentation/cubits/setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit(this.useCase)
    : super(
        SettingState(
          userInfo: UserInfoEntity.empty(),
          fileImage: null,
          blogs: [],
          isSettingSuccess: true,
        ),
      );

  final SettingUseCase useCase;

  Future<void> getUserInfo() async {
    final userInfo = await useCase.getUserInfo();
    emit(state.copyWith(userInfo: userInfo));
  }

  Future<void> pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final img = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 90,
    );
    final file = File(img!.path);

    emit(state.copyWith(fileImage: file));
  }

  Future<void> changeUserInfo(File? file, String fullName) async {
    final isChangeSuccess = await useCase.changeUserInfo(file, fullName);

    emit(state.copyWith(isSettingSuccess: isChangeSuccess));
  }

  Future<void> getBlogsById() async {
    final user = await useCase.getUserInfo();
    final listBlogs = await useCase.getBlogsById(user.id);
    emit(state.copyWith(blogs: listBlogs));
  }

  Future<void> logout() async {
    useCase.logout();
  }
}
