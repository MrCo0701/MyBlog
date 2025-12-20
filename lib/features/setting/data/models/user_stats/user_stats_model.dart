import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entity/user_stats_entity.dart';

part 'user_stats_model.freezed.dart';
part 'user_stats_model.g.dart';

@freezed
abstract class UserStatsModel with _$UserStatsModel {
  const factory UserStatsModel({
    required int postsCount,
    required int seriesCount,
  }) = _UserStatsModel;

  factory UserStatsModel.fromJson(Map<String, dynamic> json) =>
      _$UserStatsModelFromJson(json);
}

extension UserStatsModelMapper on UserStatsModel {
  UserStatsEntity toEntity() {
    return UserStatsEntity(
      postsCount: postsCount,
      seriesCount: seriesCount,
    );
  }
}