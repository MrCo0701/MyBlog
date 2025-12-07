import '../../../domain/entity/author_entity.dart';

class AuthorModel {
  final String id;
  final String fullName;
  final String? avatarUrl;

  AuthorModel({
    required this.id,
    required this.fullName,
    this.avatarUrl,
  });

  factory AuthorModel.fromJson(Map<String, dynamic> json) {
    return AuthorModel(
      id: json['id'],
      fullName: json['fullName'],
      avatarUrl: json['avatarUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'fullName': fullName, 'avatarUrl': avatarUrl};
  }

  factory AuthorModel.fromEntity(AuthorEntity entity) {
    return AuthorModel(
      id: entity.id,
      fullName: entity.fullName,
      avatarUrl: entity.avatarUrl,
    );
  }

  AuthorEntity toEntity() {
    return AuthorEntity(id: id, fullName: fullName, avatarUrl: avatarUrl);
  }
}
