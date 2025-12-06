import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entity/post_entity.dart';

part 'post_model.freezed.dart';

part 'post_model.g.dart';

@freezed
abstract class PostModel with _$PostModel {
  const factory PostModel({
    required String title,
    required String contentType,
    required List<Map<String, dynamic>> content,
    required String description,
    required String thumbnail,
    int? seriesId,
    required bool published,
    required int readTime,
    required List<String> tags,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  factory PostModel.fromEntity(PostEntity entity) {
    return PostModel(
      title: entity.title,
      contentType: entity.contentType,
      content: entity.content,
      description: entity.description,
      thumbnail: entity.thumbnail,
      seriesId: entity.seriesId,
      published: entity.published,
      readTime: entity.readTime,
      tags: entity.tags,
    );
  }
}
