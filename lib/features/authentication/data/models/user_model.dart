import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_blog/features/authentication/domain/entity/user.dart';

part 'user_model.freezed.dart';

part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    required String email,
    required String fullName,
    required String password,
  }) = _UserModel;

  UserEntity toEntity() =>
      UserEntity(email: email, fullName: fullName, password: password);

  factory UserModel.fromEntity(UserEntity user) => UserModel(
    email: user.email,
    fullName: user.fullName,
    password: user.password,
  );

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
