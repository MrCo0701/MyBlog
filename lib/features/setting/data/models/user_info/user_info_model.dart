import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_blog/features/setting/data/models/user_stats/user_stats_model.dart';

part 'user_info_model.freezed.dart';

part 'user_info_model.g.dart';

@freezed
abstract class UserInfoModel with _$UserInfoModel {
  const factory UserInfoModel({
    required String id,
    required String email,
    required String fullName,
    String? avatarUrl,
    required UserStatsModel stats,
  }) = _UserInfoModel;

  factory UserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoModelFromJson(json);
}
