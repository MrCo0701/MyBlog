import 'package:my_blog/features/setting/domain/entity/user_stats_entity.dart';

class UserInfoEntity {
  final String id;
  final String email;
  final String fullName;
  final String? avatarUrl;
  final UserStatsEntity stats;

  UserInfoEntity({
    required this.id,
    required this.email,
    required this.fullName,
    required this.avatarUrl,
    required this.stats,
  });

  factory UserInfoEntity.empty() {
    return UserInfoEntity(
      id: '',
      email: '',
      fullName: '',
      avatarUrl: '',
      stats: UserStatsEntity(postsCount: 0, seriesCount: 0),
    );
  }
}
