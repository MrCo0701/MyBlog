import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_blog/features/home/data/models/author/author_model.dart';
import 'package:my_blog/features/home/data/models/quill/quill_model.dart';
import 'package:my_blog/features/home/data/models/tag/tag_model.dart';

import '../../../domain/entity/blog_entity.dart';

part 'blog_model.freezed.dart';

part 'blog_model.g.dart';

@freezed
abstract class BlogModel with _$BlogModel {
  const BlogModel._(); // => to write toEntity()

  const factory BlogModel({
    required String? id,
    required String? title,
    required List<DeltaOpModel> content,
    required bool published,
    required List<TagModel> tags,
    required int readTime,
    required int viewCount,
    required String? createdAt,
    required AuthorModel author,
  }) = _BlogModel;

  factory BlogModel.fromJson(Map<String, dynamic> json) =>
      _$BlogModelFromJson(json);

  BlogEntity toEntity() {
    return BlogEntity(
      id: id ?? '',
      title: title ?? 'No Title',
      content: content,
      published: published,
      tags: tags,
      readTime: readTime,
      viewCount: viewCount,
      author: author.toEntity(),
      createdAt: createdAt,
    );
  }
}
