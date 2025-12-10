class UserCommentEntity {
  final String id;
  final String fullName;
  final String? avatarUrl;

  const UserCommentEntity({
    required this.id,
    required this.fullName,
    this.avatarUrl,
  });
}
